#                                               Description of Script
## Background :
This Assignment was to develop a R script to achieve the below 
* Use raw data sourced from accelerometers from the Samsung Galaxy S smartphone.
  * A full description of the dataset is available at    <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
* create one R script called run_analysis.R that does the following
  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement.
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names.
  * From the data set in step above, creates a second, independent tidy data set with the average of each variable for each activity and each  subject.
## run_analysis.R :
This script has been written to achieve the above stated objectives.
The script does the following in order 
  * Downloads the source raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
