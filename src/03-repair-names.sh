#!/bin/sh

mkdir -p CNWeeklyExport_UUID

for f in CNWeeklyExport_TSV/* ; do
    dest=`echo "$f" | grep -o 'CNWeeklyExportUUID=.*' | sed 's/CNWeeklyExportUUID=//'`
    cp "$f" "CNWeeklyExport_UUID/${dest}.csv"
done

mkdir -p CNWeeklyExport_Date

for f in CNWeeklyExport_UUID/* ; do
    b=`basename "$f" .csv`
    dest=`cat CNWeeklyExport_Index.csv | grep "^$b" | cut -d',' -f2`
    cp "$f" "CNWeeklyExport_Date/${dest}.csv"
done

