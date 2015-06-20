# Getting_and_Cleaning_Data
This is a repository for all code written for Getting and Cleaning Data course.

## Course Project

(All project-related materials is in the UCI HAR Dataset directory which was derived from unzip the main Dataset, however, copies of the important files have been put into this main directory to fulfill the submission requirement)

Unzip the source (http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:\Users\Sunil\Desktop\datasciencecoursera\Getting and Cleaning Data

Put run_analysis.R into C:\Users\Sunil\Desktop\datasciencecoursera\Getting and Cleaning Data

In RStudio: setwd("C:/Users/Sunil/Desktop/datasciencecoursera/Getting and Cleaning Data"), followed by: source("run_analysis.R")

Use data <- read.table("TidyData.txt") to read the data. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows.
