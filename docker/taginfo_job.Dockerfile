FROM ubuntu:18.04

### For the Taginfo JOB
RUN apt-get update \
    && apt-get install  -y --no-install-recommends \
       # basic tools
       apt-utils \
       build-essential \
       ca-certificates \
       curl \
       git \
       wget \
       # need for taginfo
       libbz2-dev \
       libgd-dev \
       libicu-dev \
       libosmium2-dev \
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
       osmium-tool \
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
       mapnik-utils \
       python \
       python-dev \
       python-pip \
       python-yaml \
    && rm -rf /var/lib/apt/lists/

# install python-geo libs
RUN    pip install setuptools wheel virtualenv \
    && pip install geojson \
    && pip install fiona \
    && pip install jinja2 \
    && pip install mapnik \
    && pip install psycopg2-binary \
    && pip install pycairo \
    && pip install shapely \
    && pip install yq \
    && pip list

# no documentation for gems
RUN mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

# install & config (ruby) bundler
RUN gem install bundler \
    && bundle config --global silence_root_warning 1s

WORKDIR /osm
ADD taginfo-config.json  /osm

# Set up a non-sudo user
RUN groupadd -r osm --gid=1000 && useradd -r -g osm --uid=1000 osm


RUN    git clone  --quiet --depth 1 https://github.com/taginfo/taginfo.git /osm/taginfo \
    # temporary patches
    && sed -i 's/100/10/g'                                           /osm/taginfo/sources/master/master.sql \
    && sed -i 's/(default 10000)/(default 10)/g'                     /osm/taginfo/web/lib/api/v4/keys.rb \
    && sed -i 's/min_count = 10000/min_count = 10/g'                 /osm/taginfo/web/lib/api/v4/keys.rb \
    && sed -i 's/count_all_common >= 10000/count_all_common >= 10/g' /osm/taginfo/web/lib/api/v4/keys.rb \
    && cd /osm/taginfo  \
        # backup git status
        && git log > /osm/gitlog_taginfo.txt \
        # ruby gem install
        && bundle install \
        && gem cleanup \
        && gem list \
    # Build
    && cd /osm/taginfo/tagstats \
        && make \
    # remove taginfo logo for a synbolic link
    && rm -f /osm/taginfo/web/public/img/logo/taginfo.png \
    # remove temporary config file for building
    && rm /osm/taginfo-config.json \
    \
    && chown -R osm:osm /osm

RUN mkdir -p /osm/import_admin && chown -R osm:osm /osm/import_admin && chmod 2777 /osm/import_admin
VOLUME /osm/import_admin
RUN mkdir -p /osm/import       && chown -R osm:osm /osm/import       && chmod 2777 /osm/import
VOLUME /osm/import
RUN mkdir -p /osm/service      && chown -R osm:osm /osm/service      && chmod 2777 /osm/service
VOLUME /osm/service


WORKDIR /tools

### install imposm3  ( need for setup )
ENV IMPOSMVER 0.6.0-alpha.4
RUN    wget https://github.com/omniscale/imposm3/releases/download/v${IMPOSMVER}/imposm-${IMPOSMVER}-linux-x86-64.tar.gz \
    && tar zxvf imposm-${IMPOSMVER}-linux-x86-64.tar.gz \
    && rm imposm-${IMPOSMVER}-linux-x86-64.tar.gz \
    && ln -sf imposm-${IMPOSMVER}-linux-x86-64 latest \
    && /tools/latest/imposm version

# install hugo
ENV HUGO_VERSION 0.42.2
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb -O /hugo.deb
RUN dpkg -i /hugo.deb \
    && rm /hugo.deb
#EXPOSE 1313

ENV DOWNLOAD_GEOFABRIK_VERSION v2.3.0
RUN    wget https://github.com/julien-noblet/download-geofabrik/releases/download/${DOWNLOAD_GEOFABRIK_VERSION}/download-geofabrik_linux_amd64.zip \
    && unzip download-geofabrik_linux_amd64.zip \
    && rm download-geofabrik_linux_amd64.zip

ENV KOMPOSE_VERSION 1.15.0
RUN curl -L https://github.com/kubernetes/kompose/releases/download/v${KOMPOSE_VERSION}/kompose-linux-amd64 -o kompose \
    && chmod +x kompose \
    && mv ./kompose /usr/local/bin/kompose

WORKDIR /osm
USER osm
