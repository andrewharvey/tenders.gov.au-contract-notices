all: update soft_clean

update:
	./src/01-download.sh
	./src/02-fix-csv.sh
	./src/03-repair-names.sh
	./src/04-merge-exports.sh

get_historical:
	./src/10-historical-download.sh

hard_clean: soft_clean
	# CNWeeklyExport/ is the downloaded source data (it should be static)
	# CNWeeklyExport.csv is the derived CSV export containing all the CN details from the downloaded exports
	rm -rf CNWeeklyExport/ CNWeeklyExport.csv
	rm -rf downloads/ historical_extract/

soft_clean:
	rm -rf CNWeeklyExport_Date/ CNWeeklyExport_Index.csv CNWeeklyExport_TSV/ CNWeeklyExport_UUID/ public.reports.listCNWeeklyExport.html
