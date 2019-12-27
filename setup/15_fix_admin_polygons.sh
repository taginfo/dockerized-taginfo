#! /bin/bash
set -o errexit
set -o pipefail
set -o nounset

#  | grep -v '^r47796 '   \  # NL
#  | grep -v '^r2323309 ' \  # NL - big ...
#  | grep -v '^r1311341 ' \  # ES
#  | grep -v '^r349048 '  \  # ES-CN remove
#  | grep -v '^r7248699 ' \  # IC -> ES-CN  update
#  | grep -v '^r3263728 ' \  # UK-SBA
#  | grep -v '^r148838 '  \  # USA
#

# fix NL,ES - for Europian part
osmium cat -v --no-progress /osm/import_admin/admin23456iso.osm.pbf -f opl,add_metadata=false \
  | grep -v '^r47796 '   \
  | grep -v '^r2323309 ' \
  | grep -v '^r1311341 ' \
  | grep -v '^r349048 '  \
  | grep -v '^r7248699 ' \
  | grep -v '^r3263728 ' \
  | grep -v '^r148838 '  \
  | osmium cat - --input-format opl -f osm.pbf,add_metadata=false -O -o /osm/import_admin/admin23456iso_tmp1.osm.pbf

# Add fixed NL,ES
osmium merge \
   /osm/import_admin/admin23456iso_tmp1.osm.pbf \
  ./setup/fix/47796_nl_fix.osm.xml \
  ./setup/fix/1311341_es_fix.osm.xml \
  ./setup/fix/7248699_ic_fix.osm.xml \
  ./setup/fix/3263728_uk_sba_fix.osm.xml \
  ./setup/fix/148838_us_fix.osm.xml \
  -f osm.pbf,add_metadata=false \
  -O -o /osm/import_admin/admin23456iso_fixed.osm.pbf

osmium fileinfo -e /osm/import_admin/admin23456iso.osm.pbf       | grep Number
osmium fileinfo -e /osm/import_admin/admin23456iso_fixed.osm.pbf | grep Number

ls -la /osm/import_admin/admin23456iso*.osm.pbf
