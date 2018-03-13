#FROM alpine:3.7
FROM ruby:2.5-alpine3.7

RUN set -ex \
    \
    && apk add --no-cache --virtual .run-deps \
        bzip2 \
 #       ruby \
 #       ruby-dev \
        sqlite-dev \
    \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        ca-certificates \
        git \
    \
    && gem install rack          --clear-sources --no-document  -v '<2.0.0' \
    && gem install rack-contrib  --clear-sources --no-document  -v '<2.0.0' \
    && gem install sinatra       --clear-sources --no-document  -v '<2.0.0' \
    && gem install sinatra-r18n  --clear-sources --no-document \
    && gem install json          --clear-sources --no-document \
    && gem install sqlite3       --clear-sources --no-document \
    && gem cleanup \
    && gem list \
    \
    # install apps
    && mkdir -p /osm/taginfo/ \
    && git clone  --quiet --depth 1 https://github.com/taginfo/taginfo.git /osm/taginfo \
    \
    # simple hack - modify  /reports/frequently_used_keys_without_wiki_page settings
    && sed -i 's/(default 10000)/(default 10)/g'     /osm/taginfo/web/lib/api/v4/keys.rb \
    && sed -i 's/min_count = 10000/min_count = 10/g' /osm/taginfo/web/lib/api/v4/keys.rb \
    \
    # simple hack - modify /reports/similar_keys
    && sed -i 's/count_all_common >= 10000/count_all_common >= 10/g' /osm/taginfo/web/lib/api/v4/keys.rb \
    \
    # Remove build-deps
    && apk del  .build-deps \
    # remove some files - not needed for web view...
    && rm -rf /osm/taginfo/bin \
    && rm -rf /osm/taginfo/examples \
    && rm -rf /osm/taginfo/sources \
    && rm -rf /osm/taginfo/tagstats \
    # remove caches
    && rm -rf /var/cache/apk/* /tmp/* \
    # remove taginfo logo for symbolic links!
    && rm -f /osm/taginfo/web/public/img/logo/taginfo.png

WORKDIR /osm

CMD /osm/sh/startweb.sh
