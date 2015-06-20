# Getting_and_Cleaning_Data
This is a repository for any and all code written for the Getting and Cleaning Data Coursera course through Johns Hopkins University.

## Course Project

(find all project-related materials in the UCI HAR Dataset directory, however, copies of the important files have been put into this main directory to fulfill the submission requirement)

Unzip the source (http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:\Users\Sunil\Desktop\datasciencecoursera\Getting and Cleaning Data

Put run_analysis.R into C:\Users\Sunil\Desktop\datasciencecoursera\Getting and Cleaning Data

In RStudio: setwd("C:/Users/Sunil/Desktop/datasciencecoursera/Getting and Cleaning Data"), followed by: source("run_analysis.R")

Use data <- read.table("TidyData.txt") to read the data. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows. Note that the provided R script has no assumptions on numbers of records, only on locations of files.
