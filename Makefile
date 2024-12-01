#backend
output/cleaned_batting_no_pitchers.rds: data/ATL_batting.csv code/data_clean.R
	Rscript code/data_clean.R
	
output/descriptive_table.rds: code/data_clean.R \
 code/updated_descriptive_table.R
	Rscript code/updated_descriptive_table.R
	
output/box_plot.png: code/graph.R output/descriptive_table.rds
	Rscript code/graph.R

#PHONY

.PHONY: clean
clean:
	rm -f output/*.rds output/*.png
	rm -f *.html *.pdf
	
.PHONY: install
install:
Rscript -e "renv::restore(prompt = FALSE)"