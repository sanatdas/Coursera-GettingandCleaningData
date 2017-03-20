
## ”Human Activity Recognition Using Smartphones Data Set" 

## Overview:

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The repository includes the following files:

README.md
CodeBook.md: A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.
run_analysis.R: A script for performing the analysis.
tidy_data.txt: A tidy data set after performing the analysis.
The goal is to prepare tidy data that can be used for later analysis.

## The Dataset

The data sets here are based on UCI study that recorded smartphones gyroscope and accelerometer measurements during known activities. Refer to the UCI Human Activity Recognition Using Smartphones Data Set project page. This script assumes that you have already downloaded and unzipped the original Samsung data in a folder called "Data" under the current directory.. 

The data source link : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
And its explanation: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Transformation done by run_analysis.R:

This R script does the following steps:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Usage:

Run the script run_analysis.R. The script produces a single output file, tidy_data.txt in the current directory, that contains the merged and transformed data.

You can run the scripts using: source("run_analysis.R")

## Output
The output of the analysis is clean and tidy data set that contain activity, subject and measures for all required features (i.e., mean or standard deviation). Each variable in the tidy data set measure should be in one column. And each different observation of that variable should be in a different row.
