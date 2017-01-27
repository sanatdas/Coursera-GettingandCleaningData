# codebook

### The Source file

The data for the project is taken from the following site:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Execution Process
The R Script "run_analysis.R" 
  * Downloads the data from the above site to local "./data/" folder and unzip it before the processing. if the "./data" folder does not exists, it creates the folder before loading.
  * Reads the data from the files into local variables for test data and train data
  * Merges the test data and train data to create one dataset
  * Performs the below transformations to create a final data set
  * The variable names and labels are changed as detailed below under "tranformations"
  * The tidy data set is created with required tranformation as detailed under "tranformations"
  
 
 Please refer the README file for the execution process.

### Variables
  Following dataframe variables are created to read the data from the files:
  
   * activitylabels from "./data/UCI HAR Dataset/activity_labels.txt"
   * features from "./data/UCI HAR Dataset/features.txt"
   * subjecttrain from "./data/UCI HAR Dataset/train/subject_train.txt"
   * subjecttest from "./data/UCI HAR Dataset/test/subject_test.txt"
   * featuretrain from "./data/UCI HAR Dataset/train/X_train.txt"
   * featuretest from "./data/UCI HAR Dataset/test/X_test.txt"
   * activitytrain from "./data/UCI HAR Dataset/train/y_train.txt"
   * activitytest from "./data/UCI HAR Dataset/test/y_test.txt"
     

### Transformations
  Following transformations are done to take care of the requirements:
  * read the files for activity, subject and feature
  * test and train data are merged for subject, activity and feature
  * Column names are changed to "activity", "subject" and with features names
  * Final dataset "completedata" is created by filtering on subject, activity, mean, std columns
  * Labels of the dataset is changed with descriptive variable names 
  

 #### For creating the tidy dataset:
  * From previous data set "completedata", the data set "tidydata" is created with average of each variable for each activity and each subject.
  * The dataset is written to the file "tidy_dataset.txt" in the current directory
  
