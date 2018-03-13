#!/bin/bash
pushd /osm/hugo/taginfo/

  find /osm/hugo/taginfo/* -type d -print0 | xargs -0 chmod 0755 # for directories
  find /osm/hugo/taginfo/. -type f -print0 | xargs -0 chmod 0644 # for files

  hugo
popd

rm -rf  /osm/caddy/*
cp -r   /osm/hugo/taginfo/public/*   /osm/caddy/


# chmod settings ...
find /osm/caddy/* -type d -print0 | xargs -0 chmod 0755 # for directories
find /osm/caddy/. -type f -print0 | xargs -0 chmod 0644 # for files
