#Coursera: Data Science: Getting and Cleaning Data
# Week4 final assignment

## source file ia taken from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#This R script called run_analysis.R  does the following.
#(1) Merges the training and the test sets to create one data set.
#(2) Extracts only the measurements on the mean and standard deviation for each measurement.
#(3) Uses descriptive activity names to name the activities in the data set
#(4) Appropriately labels the data set with descriptive variable names.
#(5) From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

#load the required packages and libraries
library(plyr)
library(dplyr)
library(data.table)
library(tidyr)

# download the file to data folder
if(!file.exists("./data")){
        dir.create("./data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

# unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## read data into variables
activitylabels <-  read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <-  read.table("./data/UCI HAR Dataset/features.txt")  

subjecttrain <-  read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subjecttest <-  read.table("./data/UCI HAR Dataset/test/subject_test.txt")

featuretrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
featuretest <-  read.table("./data/UCI HAR Dataset/test/X_test.txt")

activitytrain <-  read.table("./data/UCI HAR Dataset/train/y_train.txt")
activitytest <-  read.table("./data/UCI HAR Dataset/test/y_test.txt")

## Merge the training and test set to create one dataset
datasubject <- rbind(subjecttrain,subjecttest)
dataactivity <- rbind(activitytrain,activitytest)
datafeatures <-  rbind(featuretrain,featuretest)

## rename column names
names(datasubject) <- c("subject")
names(dataactivity) <- c("activity")
names(datafeatures) <- features$V2

# combine the data 
completedata <- cbind(datasubject,dataactivity,datafeatures)

#Extracts only the measurements on the mean and SD for each measurement
#subset the data based selection
subfeatures <- features$V2[grep("mean\\(\\)|std\\(\\)",features$V2)]
snames<-c(as.character(subfeatures), "subject", "activity" )
completedata <- completedata[snames]

#Uses descriptive activity names to name the activities in the data set
completedata$activity <-factor(completedata$activity,activitylabels[[1]],activitylabels[[2]])

# Appropriately labels the data set with descriptive variable names
names(completedata)<-gsub("^t", "time", names(completedata))
names(completedata)<-gsub("^f", "frequency", names(completedata))

#create a second, independent tidy data set with the average of each variable 
#for each activity and each subject
tidydata<-aggregate(completedata,by=list(completedata$subject, completedata$activity),FUN=mean)
tidydata<-tidydata[order(tidydata$subject,tidydata$activity),]
write.table(tidydata, file="tidy_dataset.txt", row.names=FALSE)
