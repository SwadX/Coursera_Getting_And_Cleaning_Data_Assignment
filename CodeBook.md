Codebook explaining the different variables used and summaries calculated, along with units, and any other relevant information.

# Raw Data Description:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

## Feature Description :
### Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## run_analysis.R output variables:

The script output is a tidy dataset that contains variables that store average of each variable for each activity and each subject.
The variable names are
"Body acceleration signal in time domain from the accelerometer mean()-X","Body acceleration signal in time domain from the accelerometer mean()-Y",
"Body acceleration signal in time domain from the accelerometer mean()-Z","Body acceleration signal in time domain from the accelerometer std()-X",
"Body acceleration signal in time domain from the accelerometer std()-Y",
"Body acceleration signal in time domain from the accelerometer std()-Z",
"Gravity acceleration signal in time domain from the accelerometer mean()-X",
"Gravity acceleration signal in time domain from the accelerometer mean()-Y",
"Gravity acceleration signal in time domain from the accelerometer mean()-Z",
"Gravity acceleration signal in time domain from the accelerometer std()-X",
"Gravity acceleration signal in time domain from the accelerometer std()-Y",
"Gravity acceleration signal in time domain from the accelerometer std()-Z",
"Body acceleration jerk signal in time domain from the accelerometer mean()-X",
"Body acceleration jerk signal in time domain from the accelerometer mean()-Y",
"Body acceleration jerk signal in time domain from the accelerometer mean()-Z",
"Body acceleration jerk signal in time domain from the accelerometer std()-X",
"Body acceleration jerk signal in time domain from the accelerometer std()-Y",
"Body acceleration jerk signal in time domain from the accelerometer std()-Z",
"Body acceleration signal in time domain from the gyroscope mean()-X",
"Body acceleration signal in time domain from the gyroscope mean()-Y",
"Body acceleration signal in time domain from the gyroscope mean()-Z",
"Body acceleration signal in time domain from the gyroscope std()-X",
"Body acceleration signal in time domain from the gyroscope std()-Y",
"Body acceleration signal in time domain from the gyroscope std()-Z",
"Body acceleration jerk signal in time domain from the gyroscope  mean()-X",
"Body acceleration jerk signal in time domain from the gyroscope  mean()-Y",
"Body acceleration jerk signal in time domain from the gyroscope  mean()-Z",
"Body acceleration jerk signal in time domain from the gyroscope  std()-X",
"Body acceleration jerk signal in time domain from the gyroscope  std()-Y",
"Body acceleration jerk signal in time domain from the gyroscope  std()-Z",
"Magnitude of body acceleration signal in time domain from the accelerometer mean()",
"Magnitude of body acceleration signal in time domain from the accelerometer std()",
"Magnitude of gravity acceleration signal in time domain from the accelerometer mean()",
"Magnitude of gravity acceleration signal in time domain from the accelerometer std()",
"Magnitude of body acceleration jerk signal in time domain from the accelerometer  mean()",
"Magnitude of body acceleration jerk signal in time domain from the accelerometer  std()",
"Magnitude of body acceleration signal in time domain from the gyroscope  mean()",
"Magnitude of body acceleration signal in time domain from the gyroscope  std()",
"Magnitude of body acceleration jerk signal in time domain from the gyroscope mean()",
"Magnitude of body acceleration jerk signal in time domain from the gyroscope std()",
"Body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied mean()-X",
"Body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied mean()-Y",
"Body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied mean()-Z",
"Body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied std()-X",
"Body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied std()-Y",
"Body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied std()-Z",
"Body acceleration jerk signal in frequency domain from the accelerometer mean()-X",
"Body acceleration jerk signal in frequency domain from the accelerometer mean()-Y",
"Body acceleration jerk signal in frequency domain from the accelerometer mean()-Z",
"Body acceleration jerk signal in frequency domain from the accelerometer std()-X",
"Body acceleration jerk signal in frequency domain from the accelerometer std()-Y",
"Body acceleration jerk signal in frequency domain from the accelerometer std()-Z",
"Body acceleration signal in frequency domain from the gyroscope with Fast Fourier Transform applied mean()-X",
"Body acceleration signal in frequency domain from the gyroscope with Fast Fourier Transform applied mean()-Y",
"Body acceleration signal in frequency domain from the gyroscope with Fast Fourier Transform applied mean()-Z",
"Body acceleration signal in frequency domain from the gyroscope with Fast Fourier Transform applied std()-X",
"Body acceleration signal in frequency domain from the gyroscope with Fast Fourier Transform applied std()-Y",
"Body acceleration signal in frequency domain from the gyroscope with Fast Fourier Transform applied std()-Z",
"Magnitude of body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied mean()",
"Magnitude of body acceleration signal in frequency domain from the accelerometer with Fast Fourier Transform applied std()",
"Magnitude of body acceleration jerk signal in frequency domain from the accelerometer with Fast Fourier Transform applied mean()",
"Magnitude of body acceleration jerk signal in frequency domain from the accelerometer with Fast Fourier Transform applied std()",
"Magnitude of body acceleration signal in frequency domain from the gyroscope mean()",
"Magnitude of body acceleration signal in frequency domain from the gyroscope std()",
"Magnitude of body acceleration jerk signal in frequency domain from the gyroscope mean()",
"Magnitude of body acceleration jerk signal in frequency domain from the gyroscope std()"
