#!/bin/sh

# This script is licensed CC0 by Andrew Harvey <andrew.harvey4@gmail.com>
#
# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

tmp=`mktemp`

rm -rf CNWeeklyExport_TSV
cp -R CNWeeklyExport CNWeeklyExport_TSV

for f in CNWeeklyExport_TSV/*; do
    cat "$f" | tail -n +3 | sed 's/^\=\"/"/' | sed 's/\t="/\t"/g' > "$tmp"
    cp "$tmp" "$f"
    dos2unix "$f"
done

rm -f $tmp
