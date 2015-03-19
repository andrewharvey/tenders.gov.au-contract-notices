#!/bin/sh

tmp=`mktemp`

rm -rf CNWeeklyExport_TSV
cp -R CNWeeklyExport CNWeeklyExport_TSV

for f in CNWeeklyExport_TSV/*; do
    cat "$f" | tail -n +3 | sed 's/^\=\"/"/' | sed 's/\t="/\t"/g' > "$tmp"
    cp "$tmp" "$f"
    dos2unix "$f"
done

rm -f $tmp
