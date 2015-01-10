#!/bin/sh

if [ `head --quiet -n1 CNWeeklyExport_TSV/* | uniq | wc -l` -ne 1 ] ; then
    echo "File Headers don't match, so can't join"
    exit 1
fi

rm -f CNWeeklyExport.csv

cat `ls -1 CNWeeklyExport_TSV/* | head -n1` > CNWeeklyExport.csv 

for f in CNWeeklyExport_TSV/* ; do
    cat "$f" | tail -n +2 >> CNWeeklyExport.csv
done
