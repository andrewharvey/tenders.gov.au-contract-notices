#!/bin/sh

# This script is licensed CC0 by Andrew Harvey <andrew.harvey4@gmail.com>
#
# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

# download the latest index of CN Weekly Exports
rm -f public.reports.listCNWeeklyExport.html
wget -O public.reports.listCNWeeklyExport.html 'https://www.tenders.gov.au/?event=public.reports.listCNWeeklyExport'

# try to download any new exports which we don't have already
cat public.reports.listCNWeeklyExport.html | grep -o '\?event=public\.reports\.downloadCNWeeklyExport[^"]*' | sed 's/^/https:\/\/www.tenders.gov.au\//' | wget -i - --trust --directory-prefix CNWeeklyExport --no-clobber

# update our UUID to date range index
cat public.reports.listCNWeeklyExport.html | grep -o 'CNWeeklyExportUUID=[^<]*' | sed -E 's/CNWeeklyExportUUID=([^"]*)">(.*)/\1,\2/' >> CNWeeklyExport_Index.csv

# removing any duplicates (which will happen when we update the list via appending)
cat CNWeeklyExport_Index.csv | sort | uniq > CNWeeklyExport_Uniq.csv
mv CNWeeklyExport_Uniq.csv CNWeeklyExport_Index.csv

