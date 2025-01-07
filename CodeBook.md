# CodeBook.md
This markdown file describes the variables, the data, and any transformations or work that was performed to clean up the data
for the programming assignment of the 'Getting and Cleaning Data' course on Coursera

## The data for the project was obtained here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value std(): Standard deviation ....

The complete list of variables of each feature vector is available in 'features.txt' " [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## The R script run_analysis.R that does the following:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## The resulting tidy dataset is in the file "TidyDataset.txt"
It contains one row for each subject/activity pair and columns for subject, activity, and each feature 
that is a mean or standard deviation of the original dataset values.

### Identifiers in TidyDataset.txt
subject: Represents each participant. There is a unique “subject” value/ID for each participant.                                      
activityName: The label of the activity performed when the corresponding measurements were taken                                 

### Activity Lables in TidyDataset.txt
Field Header “activityNum”

Values:
WALKING (value 1): subject was walking during the test
WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
SITTING (value 4): subject was sitting during the test
STANDING (value 5): subject was standing during the test
LAYING (value 6): subject was laying down during the test

### Measurements in TidyDataset.txt
Descriptive field headers                                

timeBodyAccelerometer.MEAN...X                                          
timeBodyAccelerometer.MEAN...Y                                        
timeBodyAccelerometer.MEAN...Z                
timeBodyAccelerometer.SD...X                   
timeBodyAccelerometer.SD...Y                   
timeBodyAccelerometer.SD...Z                  
timeGravityAccelerometer.MEAN...X             
timeGravityAccelerometer.MEAN...Y             
timeGravityAccelerometer.MEAN...Z             
timeGravityAccelerometer.SD...X               
timeGravityAccelerometer.SD...Y               
timeGravityAccelerometer.SD...Z               
timeBodyAccelerometerJerk.MEAN...X            
timeBodyAccelerometerJerk.MEAN...Y            
timeBodyAccelerometerJerk.MEAN...Z            
timeBodyAccelerometerJerk.SD...X              
timeBodyAccelerometerJerk.SD...Y              
timeBodyAccelerometerJerk.SD...Z              
timeBodyGyroscope.MEAN...X                    
timeBodyGyroscope.MEAN...Y                    
timeBodyGyroscope.MEAN...Z                    
timeBodyGyroscope.SD...X                      
timeBodyGyroscope.SD...Y                      
timeBodyGyroscope.SD...Z                      
timeBodyGyroscopeJerk.MEAN...X                
timeBodyGyroscopeJerk.MEAN...Y                
timeBodyGyroscopeJerk.MEAN...Z                
timeBodyGyroscopeJerk.SD...X                  
timeBodyGyroscopeJerk.SD...Y                  
timeBodyGyroscopeJerk.SD...Z                  
timeBodyAccelerometerMagnitude.MEAN..         
timeBodyAccelerometerMagnitude.SD..           
timeGravityAccelerometerMagnitude.MEAN..      
timeGravityAccelerometerMagnitude.SD..        
timeBodyAccelerometerJerkMagnitude.MEAN..     
timeBodyAccelerometerJerkMagnitude.SD..       
timeBodyGyroscopeMagnitude.MEAN..             
timeBodyGyroscopeMagnitude.SD..               
timeBodyGyroscopeJerkMagnitude.MEAN..         
timeBodyGyroscopeJerkMagnitude.SD..           
frequencyBodyAccelerometer.MEAN...X           
frequencyBodyAccelerometer.MEAN...Y           
frequencyBodyAccelerometer.MEAN...Z           
frequencyBodyAccelerometer.SD...X             
frequencyBodyAccelerometer.SD...Y             
frequencyBodyAccelerometer.SD...Z             
frequencyBodyAccelerometerJerk.MEAN...X       
frequencyBodyAccelerometerJerk.MEAN...Y       
frequencyBodyAccelerometerJerk.MEAN...Z       
frequencyBodyAccelerometerJerk.SD...X         
frequencyBodyAccelerometerJerk.SD...Y         
frequencyBodyAccelerometerJerk.SD...Z         
frequencyBodyGyroscope.MEAN...X               
frequencyBodyGyroscope.MEAN...Y               
frequencyBodyGyroscope.MEAN...Z               
frequencyBodyGyroscope.SD...X                 
frequencyBodyGyroscope.SD...Y                 
frequencyBodyGyroscope.SD...Z                 
frequencyBodyAccelerometerMagnitude.MEAN..    
frequencyBodyAccelerometerMagnitude.SD..      
frequencyBodyAccelerometerJerkMagnitude.MEAN..                
frequencyBodyAccelerometerJerkMagnitude.SD..      
frequencyBodyGyroscopeMagnitude.MEAN..        
frequencyBodyGyroscopeMagnitude.SD..         
frequencyBodyGyroscopeJerkMagnitude.MEAN..   
frequencyBodyGyroscopeJerkMagnitude.SD..      
