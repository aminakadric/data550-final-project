

output/cleaned_batting_no_pitchers.rds: data/ATL_batting.csv code/data_clean.R
	Rscript code/data_clean.R
	

output/descriptive_table.rds: code/data_clean.R \
 code/updated_descriptive_table.R
	Rscript code/updated_descriptive_table.R







.PHONY: clean


clean:
	rm -f output/*.rds
	rm -f *.html *.pdf