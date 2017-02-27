# getting-and-cleaning-data
Coursera getting and cleaning data project

## Overview
This document describes the contents of this repository and the instructions to run the scripts.

## Content
READ.md         - Describes the contents of this repository and the instructions to run the scripts.<br>
run_analysis.R  - R code that perform the analysis to tidy the data and product a cleaned and aggregated data.<br>
CODEBOOK.md     - Describes the variables of the tidied data set.<br>

## Instructions
1. Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Extract the zipped files and place the folder "UCI HAR Dataset" into [your R working directory].
3. Download the run_analysis.R file into [your R working directory\UCI HAR Dataset\]
4. Set your R working directory as [your R working directory\UCI HAR Dataset\]
5. To run the analysis, source the run_analysis.R into your R environment and then call the function run_analysis()
   source("run_analysis.R")
   run_analysis()
6. The result table from the analysis will be written into  [your R working directory\UCI HAR Dataset\]. Two result tables will be created    as cleaned_data.txt and avg_data.txt
