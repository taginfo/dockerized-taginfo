FROM ubuntu:19.10

# Setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && apt-get install -q -y tzdata && rm -rf /var/lib/apt/lists/*
# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV CFLAGS   " -march=native -O3 -g "
ENV CPPFLAGS "$CFLAGS"

### For the Taginfo JOB
RUN apt-get update \
#    && apt-get upgrade  -y \
    && apt-get install  -y --no-install-recommends \
       # basic tools
       apt-utils \
       build-essential \
       ca-certificates \
       curl \
       git \
       gnupg2 \
       wget \
       # for osmium -tool
       clang-tidy \
       cmake \
       cppcheck \
       libboost-dev \
       libboost-program-options-dev \
       # need for taginfo
       libbz2-dev \
       libgd-dev \
       libicu-dev \
       libsparsehash-dev \
       libsqlite3-dev \
       m4 \
       pbzip2 \
       ruby \
       ruby-dev \
       ruby-sqlite3 \
       sqlite3 \
       # tools
       gdal-bin \
       imagemagick \
       jq \
       mc \
       sudo \
       unzip \
       #geos tools
       libcairo2-dev \
       libcurl4-gnutls-dev \
       libgdal-dev \
       libgeos-dev \
       libpq-dev \
       libproj-dev \
       libxml2-dev \
       libxslt-dev \
       postgresql-client \
       # python tools
       python3 \
       python3-dev \
       python3-pip \
       python3-yaml \
       python3-mapnik \
    && rm -rf /var/lib/apt/lists/

RUN    python3 -m pip install --no-cache-dir --upgrade pip \
    && python3 -m pip install --no-cache-dir --upgrade setuptools wheel virtualenv \
    && python3 -m pip install --no-cache-dir --upgrade geojson \
    && python3 -m pip install --no-cache-dir --upgrade fiona \
    && python3 -m pip install --no-cache-dir --upgrade jinja2 \
    && python3 -m pip install --no-cache-dir --upgrade psycopg2-binary \
    && python3 -m pip install --no-cache-dir --upgrade shapely \
    && python3 -m pip install --no-cache-dir --upgrade yq \
    && python3 -m pip list \
    && rm -fr ~/.cache/pip*

WORKDIR /tools

### install imposm3  ( need for setup )
ENV IMPOSMVER 0.10.0
RUN    wget https://github.com/omniscale/imposm3/releases/download/v${IMPOSMVER}/imposm-${IMPOSMVER}-linux-x86-64.tar.gz \
    && tar zxvf imposm-${IMPOSMVER}-linux-x86-64.tar.gz \
    && rm imposm-${IMPOSMVER}-linux-x86-64.tar.gz \
    && ln -sf imposm-${IMPOSMVER}-linux-x86-64 latest \
    && /tools/latest/imposm version

# install hugo
ENV HUGO_VERSION 0.61.0
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb -O /hugo.deb
RUN dpkg -i /hugo.deb \
    && rm /hugo.deb
#EXPOSE 1313

ENV DOWNLOAD_GEOFABRIK_VERSION 2.5.1-rc1
RUN    wget https://github.com/julien-noblet/download-geofabrik/releases/download/v${DOWNLOAD_GEOFABRIK_VERSION}/download-geofabrik_${DOWNLOAD_GEOFABRIK_VERSION}_Linux_x86_64.tar.gz \
    && tar zxvf download-geofabrik_${DOWNLOAD_GEOFABRIK_VERSION}_Linux_x86_64.tar.gz \
    && rm       download-geofabrik_${DOWNLOAD_GEOFABRIK_VERSION}_Linux_x86_64.tar.gz

WORKDIR /osm
# install latest(master) libosmium, osmium-tool
RUN    git clone --quiet --depth 1 https://github.com/mapbox/protozero.git \
    && git clone --quiet --depth 1 https://github.com/osmcode/libosmium.git \
    && git clone --quiet --depth 1 https://github.com/osmcode/osmium-tool.git \
    && mkdir -p ./osmium-tool/build \
    && cd ./osmium-tool/build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make -j$(nproc) \
    && ctest --output-on-failure \
    && make install \
    && osmium --version

# Set up a non-sudo user - same gid, uid as a host user
ARG host_uid
ENV HOST_UID=${host_uid}
ARG host_gid
ENV HOST_GID=${host_gid}
RUN  echo "params: HOST_UID=${HOST_UID} ; HOST_GID=${HOST_GID} " \
     && groupadd -r           --gid=${HOST_GID} osm \
     && useradd  -r -m -g osm --uid=${HOST_UID} osm

USER root


ENV JULIA_MAJOR=1.3
ENV JULIA_VERSION=1.3.0
ENV JULIA_SHA256=9ec9e8076f65bef9ba1fb3c58037743c5abb3b53d845b827e44a37e7bcacffe8

ENV JULIA_DIR=/usr/local/julia
ENV JULIA_PATH=${JULIA_DIR}
RUN mkdir ${JULIA_DIR} && \
    cd /tmp && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/${JULIA_MAJOR}/julia-${JULIA_VERSION}-linux-x86_64.tar.gz && \
    echo "$JULIA_SHA256 julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf julia-${JULIA_VERSION}-linux-x86_64.tar.gz -C ${JULIA_DIR} --strip-components=1 && \
    rm /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz
RUN ln -fs ${JULIA_DIR}/bin/julia /usr/local/bin/julia

USER osm

RUN    julia -e 'using Pkg; Pkg.REPLMode.pkgstr("add CSV        ;precompile");using CSV' \
    && julia -e 'using Pkg; Pkg.REPLMode.pkgstr("add DataFrames ;precompile");using DataFrames' \
    && julia -e 'using Pkg; Pkg.REPLMode.pkgstr("add DataStreams;precompile");using DataStreams' \
    && julia -e 'using Pkg; Pkg.REPLMode.pkgstr("add JSON       ;precompile");using JSON' \
    && julia -e 'using Pkg; Pkg.REPLMode.pkgstr("add LibPQ      ;precompile");using LibPQ' \
    && julia -e 'using Pkg; Pkg.REPLMode.pkgstr("add SQLite     ;precompile");using SQLite' \
    && julia -e 'using Pkg; Pkg.REPLMode.pkgstr("add XLSX       ;precompile");using XLSX'

USER root

# no documentation for gems
RUN mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

# install & config (ruby) bundler
RUN gem install bundler \
    && bundle config --global silence_root_warning 1s \
    && gem cleanup all \
# Dummy version - for docker cache ..
ENV ver_ImreSamu_taginfo=201809252100
ADD taginfo-config.json  /osm
# Install & compile Taginfo.
RUN    git clone  --quiet --depth 1 --branch name_tabs_v2 https://github.com/ImreSamu/taginfo.git /osm/taginfo \
    && cd /osm/taginfo  \
        # ruby gem install
        && gem install rack             --clear-sources --no-document \
        && gem install rack-contrib     --clear-sources --no-document \
        # && gem install specific_install --clear-sources --no-document \
        # && gem specific_install -l https://github.com/jkowens/sinatra.git -b fix-1443 \
        && gem install sinatra          --clear-sources --no-document \
        && gem install sinatra-r18n     --clear-sources --no-document \
        && gem install json             --clear-sources --no-document \
        && gem install sqlite3          --clear-sources --no-document \
        && gem install puma             --clear-sources --no-document \
        # gem clean
        #&& gem uninstall specific_install \
        && gem cleanup all \
        && gem list

    # Build
RUN cd /osm/taginfo/tagstats \
        && make \
    \
    && chown -R osm:osm /osm

RUN mkdir -p /osm/import_admin && chown -R osm:osm /osm/import_admin && chmod 2777 /osm/import_admin
VOLUME /osm/import_admin
RUN mkdir -p /osm/import       && chown -R osm:osm /osm/import       && chmod 2777 /osm/import
VOLUME /osm/import
RUN mkdir -p /osm/service      && chown -R osm:osm /osm/service      && chmod 2777 /osm/service
VOLUME /osm/service

ADD normalized_names.jl /osm/taginfo/sources/master
ADD problematic_tags.jl /osm/taginfo/sources/master

WORKDIR /osm
USER osm
