FROM rocker/r-ubuntu:latest

RUN apt-get update && apt-get install -y pandoc && apt-get install -y vim
RUN apt-get update && apt-get install -y libcurl4-openssl-dev
RUN apt-get -y install libxml2-dev 


RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('gtsummary')"
RUN Rscript -e "install.packages('janitor')"
RUN Rscript -e "install.packages('readr')"



RUN mkdir /final_project
WORKDIR /final_project
COPY README.md .
COPY Makefile .
COPY Dockerfile .
COPY Final_Project2_AK.Rmd .
COPY .gitignore .
COPY bootleg.lock .


COPY data data
COPY code code


RUN mkdir output
RUN mkdir final_report


CMD make && mv Final_Project2_AK.html final_report







