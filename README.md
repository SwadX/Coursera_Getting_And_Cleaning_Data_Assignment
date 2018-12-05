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
The script does the following: 
  * Downloads the source raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * Uncompresses the zip file in a local folder in the R studio working directory.
  * Create dataframes from the meta data files of activity labels and features.
  * Creates dataframes from the test and train datasets.
  * Removes duplicate feature columns from the test and train datasets.
  * Select only required measures of mean and standard deviation from the feature columns.
  * Join all test dataframes into one dataframe.
  * Join all train dataframes into one dataframe.
  * Append the combined test and train records into one dataframe.
  * Label the combined dataframe with descriptive variable names.
  * Create a tidy dataset using the above dataframe with the average of each variable for each activity and each subject.
