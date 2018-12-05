# ############################################################################
# This script does the following
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names.
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# ############################################################################ 

library(dplyr)
library(stringr)

#downoad the source files and save in working directory
#extract the zip file contents inside the samsung_wearable folder

##download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip','samsung_wearable.zip')
##unzip(zipfile = 'samsung_wearable.zip',exdir='./samsung_wearable')

#read meta data files

activities <- read.table("./samsung_wearable/UCI HAR Dataset/activity_labels.txt",header = FALSE,sep = "",col.names = c('Activity_Key','Activity_Name'))
features <- read.table("./samsung_wearable/UCI HAR Dataset/features.txt",header = FALSE,sep = "",col.names = c('Feature_Key','Feature_Name'))




#read test data files
activity_test <- read.table("./samsung_wearable/UCI HAR Dataset/test/y_test.txt",header = FALSE,sep = "",col.names = c('Activity_Key'))
feature_test  <- read.table("./samsung_wearable/UCI HAR Dataset/test/X_test.txt",header = FALSE,sep = "")
names(feature_test) <- features$Feature_Name

# remove duplicated columns
feature_test <- feature_test[,!duplicated(colnames(feature_test))]

subject_test  <- read.table("./samsung_wearable/UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep = "",col.names =c('Subject_Key'))

#select only required measures i.e mean and standard deviation
required_feature_test <- dplyr::select(feature_test,matches('mean\\(\\)|std\\(\\)'))

#join test data for subject , activity and features
test_data <- cbind(subject_test,activity_test,required_feature_test)

#read train data files
activity_train <- read.table("./samsung_wearable/UCI HAR Dataset/train/y_train.txt",header = FALSE,sep = "",col.names = c('Activity_Key'))
feature_train  <- read.table("./samsung_wearable/UCI HAR Dataset/train/X_train.txt",header = FALSE,sep = "")
names(feature_train) <- features$Feature_Name

# remove duplicated columns
feature_train <- feature_train[,!duplicated(colnames(feature_train))]

subject_train  <- read.table("./samsung_wearable/UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep = "",col.names =c('Subject_Key'))

#select only required measures i.e mean and standard deviation
required_feature_train <- dplyr::select(feature_train,matches('mean\\(\\)|std\\(\\)'))

#join train data for subject , activity and features
train_data <- cbind(subject_train,activity_train,required_feature_train)

#Append the training and the test sets to create one data set.
complete_data <- rbind(test_data,train_data)

# Add Descriptive Activity Name column
complete_data <- dplyr::inner_join(complete_data,activities,by = "Activity_Key",copy = TRUE)

#Label the dataset with descriptive variable names 
#time dimesion
names(complete_data) <- gsub("tBodyAcc-","Body acceleration signal in time domain from the accelerometer ",names(complete_data))
names(complete_data) <- gsub("^tBodyGyro-","Body acceleration signal in time domain from the gyroscope ",names(complete_data))
names(complete_data) <- gsub("^tBodyAccMag-","Magnitude of body acceleration signal in time domain from the accelerometer ",names(complete_data))
names(complete_data) <- gsub("^tBodyAccJerk-","Body acceleration jerk signal in time domain from the accelerometer ",names(complete_data))
names(complete_data) <- gsub("^tBodyAccJerkMag-","Magnitude of body acceleration jerk signal in time domain from the accelerometer  ",names(complete_data))
names(complete_data) <- gsub("^tBodyGyroMag-","Magnitude of body acceleration signal in time domain from the gyroscope  ",names(complete_data))
names(complete_data) <- gsub("^tBodyGyroJerk-","Body acceleration jerk signal in time domain from the gyroscope  ",names(complete_data))
names(complete_data) <- gsub("^tBodyGyroJerkMag-","Magnitude of body acceleration jerk signal in time domain from the gyroscope ",names(complete_data))
names(complete_data) <- gsub("^tGravityAcc-","Gravity acceleration signal in time domain from the accelerometer ",names(complete_data))
names(complete_data) <- gsub("^tGravityAccMag-","Magnitude of gravity acceleration signal in time domain from the accelerometer ",names(complete_data))
#frequency dimension
names(complete_data) <- gsub("^fBodyAcc-","Body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied ",names(complete_data))
names(complete_data) <- gsub("^fBodyAccMag-","Magnitude of body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied ",names(complete_data))
names(complete_data) <- gsub("^fBodyGyro-","Body acceleration signal in frequency domain from the gyroscope with Fast Fourier Transform applied ",names(complete_data))
names(complete_data) <- gsub("^fBodyBodyAccJerkMag-","Magnitude of body acceleration jerk signal in frequency domain from the accelerometer with Fast Fourier Transform applied ",names(complete_data))
names(complete_data) <- gsub("^fBodyBodyGyroJerkMag-","Magnitude of body acceleration jerk signal in frequency domain from the gyroscope ",names(complete_data))
names(complete_data) <- gsub("^fBodyBodyGyroMag-","Magnitude of body acceleration signal in frequency domain from the gyroscope ",names(complete_data))
names(complete_data) <- gsub("^fBodyAccJerk-","Body acceleration jerk signal in frequency domain from the accelerometer ",names(complete_data))

# Create a tidy dataset with the average of each variable for each activity and each subject.
tidy_data <- complete_data %>% dplyr::group_by(Subject_Key,Activity_Name) %>% summarise_all(mean)

write.table(tidy_data, "Samsung_TidyData.txt", row.name=FALSE)
