


cd /osm/hugo
hugo new site taginfo
cd taginfo
git clone   --quiet --depth 1 https://github.com/digitalcraftsman/hugo-material-docs.git themes/hugo-material-docs

cp    /osm/setup/hugo/config.toml  /osm/hugo/taginfo
cp -r /osm/setup/hugo/content/*    /osm/hugo/taginfo/content/

