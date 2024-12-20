# REPORT-ASSOCIATED RULES

final_report.html: code/render.R data descriptive_table box_plot
	Rscript code/render.R

output/cleaned_batting_no_pitchers.rds: data/ATL_batting.csv code/data_clean.R
	Rscript code/data_clean.R
	
output/descriptive_table.rds: code/data_clean.R \
 code/updated_descriptive_table.R
	Rscript code/updated_descriptive_table.R
	
output/box_plot.png: code/graph.R output/descriptive_table.rds
	Rscript code/graph.R

.PHONY: data
data: output/cleaned_batting_no_pitchers.rds

.PHONY: descriptive_table
descriptive_table: output/descriptive_table.rds

.PHONY: box_plot
box_plot: output/box_plot.png

.PHONY: clean
clean:
	rm -f output/*.rds output/*.png
	rm -f *.html *.pdf
	rm -f final_report/*.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"


# DOCKER-ASSOCIATED RULES

# building the report image
PROJECTFILES = code/render.R data descriptive_table box_plot code/data_clean.R \
  Makefile Final_Project2_AK.Rmd

project_image: Dockerfile $(PROJECTFILES)
	docker build -t project_image .
	touch $@


# building the report automatically
final_report/Final_Project2_AK.html: project_image
	docker run -v /$$(pwd)/final_report:/final_project/final_report project_image




