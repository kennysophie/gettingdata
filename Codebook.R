#Getting Data Project: Tidy Data of the Samsung Wearable Devices
#Wearable devices are an exciting prospect for data scientists everywhere. 
# Samsung has acquired such data, which is the basis for our this course's project. 
# Our objective was to tidy up the raw dataset according to the principles learned 
# 'Getting Data' Coursera Online Class. 
# 
# Samsung give the following summary description on the page where a full description of the original data is available: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
#*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
#*Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
#*Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.
#*The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
#*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
#*The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
#*From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
#
# 
## There are 89 variables in tidy dataset. It is organized in long for, whereas each combination of subject ('subjectID'), action performed ('labels'), and training phase ('prepost') corresponds to one row, and each additional column contains data for a single variable.
#[1] "subjectID" : The unique subject identification number, from 1 to 30. 
#[2] "labels"  : The actions, 'LAYING', 'SITTING', 'STANDING', 'WALKING', 'WALKING_DOWNSTAIRS', 'WALKING_UPSTAIRS'                                           
#[3] "prepost" : Whether the data were recorded during training ('0', ie, the pretest) or during testing ('1', ie, post training)                                    
# [4:9] "timeBodyAccelerationXMean", "timeBodyAccelerationYMean" ,"timeBodyAccelerationZMean", "timeBodyAccelerationXStd", "timeBodyAccelerationYStd", "timeBodyAccelerationZStd" : Mean and STD of timeseries of body accelerations in cartesian coordinates                        
# [10:15] "timeGravityAccelerationXMean" , "timeGravityAccelerationYMean" , "timeGravityAccelerationZMean", "timeGravityAccelerationXStd", "timeGravityAccelerationYStd", "timeGravityAccelerationZStd": Mean and STD of timeseries of body accelerations  in cartesian coordinates (Triaxial acceleration from the accelerometer (total acceleration))                  
# [16:21] "timeBodyAccelerationJerkXMean" , "timeBodyAccelerationJerkYMean" , "timeBodyAccelerationJerkZMean" ,"timeBodyAccelerationJerkXStd"  ,"timeBodyAccelerationJerkYStd", "timeBodyAccelerationJerkZStd" :Mean and STD of timeseries of body accelerations jerks  in cartesian coordinates   (Triaxial Angular velocity from the gyroscope)
# [22:27] "timeBodyGyroXMean" ,"timeBodyGyroYMean" , "timeBodyGyroZMean" ,"timeBodyGyroXStd" , "timeBodyGyroYStd" , "timeBodyGyroZStd" :  Mean and STD of timeseries of gyroscopic measurements in cartesian coordinates                             
# [28:33] "timeBodyGyroJerkXMean","timeBodyGyroJerkYMean", "timeBodyGyroJerkZMean", "timeBodyGyroJerkXStd", "timeBodyGyroJerkYStd", "timeBodyGyroJerkZStd": Mean and TD of timeseries of gyroscpic jerk measurements in cartesian coordinates.                            
# [34:35] "timeBodyAccelerationMagnitudeMean", "timeBodyAccelerationMagnitudeStd": Mean and STD of timeseries of body acceleration magnitudes.
# [36:37]"timeGravityAccelerationMagnitudeMean", "timeGravityAccelerationMagnitudeStd":  Mean and STD of timeseries of gravity acceleration magnitudes.
# [38:39] "timeBodyAccelerationJerkMagnitudeMean", "timeBodyAccelerationJerkMagnitudeStd":  Mean and STD of timeseries of body acceleration jerk magnitudes.
# [40:41] "timeBodyGyroMagnitudeMean", "timeBodyGyroMagnitudeStd": Mean and STD of timeseries of the mean magnitude ofgyroscopic measurements
# [42:43] "timeBodyGyroJerkMagnitudeMean", "timeBodyGyroJerkMagnitudeStd": Mean and STD of timeseries of the mean jerk magnitude ofgyroscopic measurements
#[44:49] "forceBodyAccelerationXMean", "forceBodyAccelerationYMean", "forceBodyAccelerationZMean", "forceBodyAccelerationXStd",  "forceBodyAccelerationYStd", "forceBodyAccelerationZStd",: Mean and STD of timeseries of body accelerations in cartesian coordinates, from force data 
#[49:52]"forceBodyAccelerationXMeanFrequency", "forceBodyAccelerationYMeanFrequency", "forceBodyAccelerationZMeanFrequency": mean frequency of body acceleration by cartesian axis, from force data
# [53:58] "forceBodyAccelerationJerkXMean", "forceBodyAccelerationJerkYMean", "forceBodyAccelerationJerkZMean", "forceBodyAccelerationJerkXStd", "forceBodyAccelerationJerkYStd", "forceBodyAccelerationJerkZStd"  : mean body jerk acceleration by cartesian axis, from force data                  
#[59:61] "forceBodyAccelerationJerkXMeanFrequency", "forceBodyAccelerationJerkYMeanFrequency", "forceBodyAccelerationJerkZMeanFrequency": mean frequency of body jerk acceleration by cartesian axis, from force data             
#[62:67] "forceBodyGyroXMean", "forceBodyGyroYMean", "forceBodyGyroZMean", "forceBodyGyroXStd", "forceBodyGyroYStd", "forceBodyGyroZStd"  : mean and std force of body in cartesian coordinates, measure by triaxial gyroscpe.                                              
#[68:70] "forceBodyGyroXMeanFrequency",  "forceBodyGyroYMeanFrequency", "forceBodyGyroZMeanFrequency"  :    Mean frequency of body gyroscopic measurements in cartesian coordinates                       
#[71:72] "forceBodyAccelerationMagnitudeMean", "forceBodyAccelerationMagnitudeStd":       mean and std force of body acceledation.         
#[73] "forceBodyAccelerationMagnitudeMeanFrequency"  :        mean frequency of the force of body acceleration . 
#[74] "forceBodyBodyAccelerationJerkMagnitudeMeanFrequency":  mean frequency of the force of body acceleration in jerk
# [75:76] "forceBodyBodyGyroMagnitudeMean",  "forceBodyBodyGyroMagnitudeStd":   mean and std force magnitude of body from the gyroscpe data           
#[77:78] "forceBodyBodyGyroJerkMagnitudeMean", "forceBodyBodyGyroJerkMagnitudeStd"  :  mean and std force  magnitude of body jerks from the gyroscpe.
#[79] "fBodyBodyGyroMag-meanFreq()": substracting mean frequency from the force magnitude of body from the gyroscpe data                  
#[80:82] "fBodyBodyGyroJerkMag-mean()",  "fBodyBodyGyroJerkMag-std()", "fBodyBodyGyroJerkMag-meanFreq()":  substraction mean force, std, and meanfrequency from the   force  magnitude of body jerks from the gyroscpe.           
#[83] "angle(tBodyAccMean,gravity)":   computed angle of  mean body acceleration   with respect to gravity              
#[84] "angle(tBodyAccJerkMean),gravityMean)" : computed angle of  mean body acceleration at jerks  with respect to mean gravity               
#[85] "angle(tBodyGyroMean,gravityMean)"computed angle of  mean body acceleration from gyroscopic data  with respect to mean gravity 
#[86]"angle(tBodyGyroJerkMean,gravityMean)": computed angle of  mean body acceleration  at jeark  with respect to meangravity            
#[87:89] "angle(X,gravityMean)",  "angle(Y,gravityMean)",  "angle(Z,gravityMean)": Estimated angle with respect to mean gravity, in each cartesian coordinate

