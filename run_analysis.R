filesPath <- "C:/Users/Sunil/Desktop/datasciencecoursera/Getting and Cleaning Data"

setwd(filesPath)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile="./data/Dataset.zip")

##Unzip DataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


##Load required packages
library(dplyr)
library(data.table)
library(tidyr)

filesPath <- "C:/Users/Sunil/Desktop/datasciencecoursera/Getting and Cleaning Data/data/UCI HAR Dataset"
##Read subject files
dataSubjectTrain <- tbl_df(read.table(file.path(filesPath, "train", "subject_train.txt")))
dataSubjectTest  <- tbl_df(read.table(file.path(filesPath, "test" , "subject_test.txt" )))


##Read data files.
dataTrain <- tbl_df(read.table(file.path(filesPath, "train", "X_train.txt" )))
dataTest  <- tbl_df(read.table(file.path(filesPath, "test" , "X_test.txt" )))

##Read activity files
dataActivityTrain <- tbl_df(read.table(file.path(filesPath, "train", "y_train.txt")))
dataActivityTest  <- tbl_df(read.table(file.path(filesPath, "test" , "y_test.txt" )))

## for both Activity and Subject files this will merge the training and the test sets by row binding 
##and rename variables "subject" and "activityNum"
alldataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
setnames(alldataSubject, "V1", "subject")
alldataActivity<- rbind(dataActivityTrain, dataActivityTest)
setnames(alldataActivity, "V1", "activityNum")

##combine the DATA (training and test) files
dataTable <- rbind(dataTrain, dataTest)

## name variables according to feature e.g.(V1 = "tBodyAcc-mean()-X")
dataFeatures <- tbl_df(read.table(file.path(filesPath, "features.txt")))
setnames(dataFeatures, names(dataFeatures), c("featureNum", "featureName"))
colnames(dataTable) <- dataFeatures$featureName

##column names for activity labels
activityLabels<- tbl_df(read.table(file.path(filesPath, "activity_labels.txt")))
setnames(activityLabels, names(activityLabels), c("activityNum","activityName"))

## Merge columns
alldataSubjAct<- cbind(alldataSubject, alldataActivity)
dataTable <- cbind(alldataSubjAct, dataTable)

## Reading "features.txt" and extracting only the mean and standard deviation
dataFeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)",dataFeatures$featureName,value=TRUE) #var name

## Taking only measurements for the mean and standard deviation and adding "subject","activityNum"

dataFeaturesMeanStd <- union(c("subject","activityNum"), dataFeaturesMeanStd)
dataTable<- subset(dataTable,select=dataFeaturesMeanStd) 

## enter name of activity into dataTable
dataTable <- merge(activityLabels, dataTable , by="activityNum", all.x=TRUE)
dataTable$activityName <- as.character(dataTable$activityName)

## create dataTable with variable means sorted by subject and Activity
dataAggr<- aggregate(. ~ subject - activityName, data = dataTable, mean) 
dataTable<- tbl_df(arrange(dataAggr,subject,activityName))

##Names before extra cleaning
head(str(dataTable),2)

##*********extra cleaning****##
names(dataTable)<-gsub("std()", "SD", names(dataTable))
names(dataTable)<-gsub("mean()", "MEAN", names(dataTable))
names(dataTable)<-gsub("^t", "time", names(dataTable))
names(dataTable)<-gsub("^f", "frequency", names(dataTable))
names(dataTable)<-gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable)<-gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable)<-gsub("Mag", "Magnitude", names(dataTable))
names(dataTable)<-gsub("BodyBody", "Body", names(dataTable))

## Names after extra cleaning
head(str(dataTable),2)

## write to text file on disk
write.table(dataTable, "TidyData.txt", row.name=FALSE)


## Reading TidyData file
filesPath <- "C:/Users/Sunil/Desktop/datasciencecoursera/Getting and Cleaning Data"
TidyData <- tbl_df(read.table(file.path(filesPath, "TidyData.txt")))
head(TidyData, n=4)
tail(TidyData, n=4)
str(TidyData)
<<<<<<< HEAD

=======
>>>>>>> 0c191b56f1ffcf5909884314d3e795792af869ef
