# Final Project (click "Preview" to view as an html document)

This repository includes contents for the final project for __DATA550.__

## Introduction

The data set contains stats from the players of the Atlanta Braves baseball 
team ranging from 1966 to 2023. This includes their age, position played, number
of ball hits, home runs, and dominant hand. For this project, we are interested
in years 1995 and 2021 which are the years the Braves won the World Series. In 
particular, this repository aims to compare the batting stats between the two years.

Variables of focus include batting average, stolen bases, home runs, number of 
games played, and dominant hand.

## Code Structure

The directories in the repository are output, data, and code.

The data folder contains the raw data. The code folder includes R scripts

data_clean.R selects years 1995 and 2021, selects our wanted variables, and removes pitchers since pitchers do not typically bat

updated_descriptive_table.R contains the code to make a table compare batting
stats for 1995 and 2021

graph.R contains code to create a box block. 

render.R will be used to render the final html report.

Lastly, the Makefile pulls all these R scripts together to build the report automatically
using the Dockerfile

# How to build the docker image in the terminal:

In the terminal, type `docker build -t project_image .`


# Link to Docker image from DockerHub:

In your web browser, navigate to this following link:
https://hub.docker.com/repository/docker/aminakadric/project_image/general


# How to generate the report automatically:

Ensure that you have navigated to the proper folder in your console and terminal
using `pwd` in the terminal and `getwd()` and `setwd()` in the the console.

## Mounting your Directory

Navigate to the bottom of the Makefile where it says */$$(pwd)/final_report:/final_project/final_report project_image*

If your local file path to the final_project directory contains spaces. Quotation marks
must be placed at the beginning and before the colon:

*"/$$(pwd)/final_report:"/final_project/final_report project_image*

# Using make to generate the final report 

In the terminal, type `make final_report/Final_Project2_AK.html` and press enter.

To view the report, navigate to the final_report folder where the Final_Project2_AK.html
should be located. Click this file to view in browser.



