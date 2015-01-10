#!/bin/sh

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

