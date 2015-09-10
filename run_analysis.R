## Step 1: Load the required library.
library(dplyr) #dplyr R 3.1.3

## Step 2: Download and unzip the data file in the current directory. 
currentPath<- getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = 'temp.zip', method = "curl")
unzip('temp.zip')

## Step 3: Read the data and prepare the data frames.
activitylabels<- read.table(paste(currentPath,'/UCI HAR Dataset','/activity_labels.txt', sep = ''))
features<- as.character(read.table(paste(currentPath,'/UCI HAR Dataset','/features.txt', sep = ''))[,2])

## Step 4: Extract only the mean and standard deviation measurements
# 4a: Start by loading the two datasets
X_train <- read.table(paste(currentPath,'/UCI HAR Dataset','/train','/X_train.txt', sep = ''))
colnames(X_train)<-features
X_train$labels  <- as.numeric(unlist((read.table(paste(currentPath,'/UCI HAR Dataset','/train','/y_train.txt', sep = '')))))
X_train$subjectID <- as.numeric(unlist(read.table(paste(currentPath,'/UCI HAR Dataset','/train','/subject_train.txt', sep = ''))))
X_train$prepost <-0 #0: train

X_test <- read.table(paste(currentPath,'/UCI HAR Dataset','/test','/X_test.txt', sep = ''))
colnames(X_test)<-features
X_test$labels<- as.numeric(unlist(read.table(paste(currentPath,'/UCI HAR Dataset','/test','/y_test.txt', sep = ''))))
X_test$subjectID <- as.numeric(unlist(read.table(paste(currentPath,'/UCI HAR Dataset','/test','/subject_test.txt', sep = ''))))
X_test$prepost <-1 #0: train

#4b: Now extract the mean and std dependent variables (along with some identifier variables)
# The following two lines do the same as: columns2 = c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y" , "tBodyAcc-mean()-Z", "tBodyAcc-std()-X" , "tBodyAcc-std()-Y", "tBodyAcc-std()-Z" , "tGravityAcc-mean()-X","tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X" , "tGravityAcc-std()-Y", "tGravityAcc-std()-Z" ,"tBodyAccJerk-mean()-X" ,"tBodyAccJerk-mean()-Y" , "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X" ,"tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z" ,"tBodyGyro-mean()-X" ,"tBodyGyro-mean()-Y" ,"tBodyGyro-mean()-Z", "tBodyGyro-std()-X" ,"tBodyGyro-std()-Y","tBodyGyro-std()-Z" ,"tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X" ,"tBodyGyroJerk-std()-Y" ,"tBodyGyroJerk-std()-Z" ,"tBodyAccMag-mean()", "tBodyAccMag-std()" ,"tGravityAccMag-mean()" ,"tGravityAccMag-std()" ,"tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()" ,"tBodyGyroMag-std()" ,"tBodyGyroJerkMag-mean()" ,"tBodyGyroJerkMag-std()" , "fBodyAcc-mean()-X" ,"fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z" ,"fBodyAcc-std()-X", "fBodyAcc-std()-Y" ,"fBodyAcc-std()-Z" , "fBodyAcc-meanFreq()-X" , "fBodyAcc-meanFreq()-Y" ,"fBodyAcc-meanFreq()-Z" ,"fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y" ,"fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z" , "fBodyAccJerk-meanFreq()-X" , "fBodyAccJerk-meanFreq()-Y" , "fBodyAccJerk-meanFreq()-Z" , "fBodyGyro-mean()-X" , "fBodyGyro-mean()-Y" , "fBodyGyro-mean()-Z" , "fBodyGyro-std()-X" , "fBodyGyro-std()-Y" , "fBodyGyro-std()-Z" ,  "fBodyGyro-meanFreq()-X" , "fBodyGyro-meanFreq()-Y" , "fBodyGyro-meanFreq()-Z" ,"fBodyAccMag-mean()", "fBodyAccMag-std()" ,"fBodyAccMag-meanFreq()" , "fBodyBodyAccJerkMag-meanFreq()" ,"fBodyBodyGyroMag-mean()" , "fBodyBodyGyroMag-std()" ,"fBodyBodyGyroJerkMag-mean()" ,"fBodyBodyGyroJerkMag-std()" , "labels" ,"subjectID" ,"prepost" )
varColumns = names(X_train)[grepl('mean', names(X_train))|grepl('Mean', names(X_train))|grepl('std', names(X_train))] 
X_train <- X_train[c(varColumns, c('labels', 'subjectID', 'prepost'))]  
X_test<-X_test[c(varColumns, c('labels', 'subjectID', 'prepost'))]

## Step 5: Merges the training and the test set horizontally [they are sorted appropriately]. In the previous step, an identifier variable tags them to their appropriate condition 
dataset<- rbind(X_train, X_test)

## Step 6: Uses descriptive activity names to name the activities in the data set
dataset$labels =  activitylabels$V2[dataset$labels]

##Step 7: Appropriately labels the data set with descriptive variable names.
#Note: When I first did this, I expected it to be much less time costly. I would not recommend it and suggest a string replacement strategy!
names(dataset)[1] <-paste('timeBodyAccelerationXMean')
names(dataset)[2] <-paste('timeBodyAccelerationYMean')
names(dataset)[3] <-paste('timeBodyAccelerationZMean')

names(dataset)[4] <-paste('timeBodyAccelerationXStd')
names(dataset)[5] <-paste('timeBodyAccelerationYStd')
names(dataset)[6] <-paste('timeBodyAccelerationZStd')

names(dataset)[7] <-paste('timeGravityAccelerationXMean')
names(dataset)[8] <-paste('timeGravityAccelerationYMean')
names(dataset)[9] <-paste('timeGravityAccelerationZMean')

names(dataset)[10] <-paste('timeGravityAccelerationXStd')
names(dataset)[11] <-paste('timeGravityAccelerationYStd')
names(dataset)[12] <-paste('timeGravityAccelerationZStd')

names(dataset)[13] <-paste('timeBodyAccelerationJerkXMean')
names(dataset)[14] <-paste('timeBodyAccelerationJerkYMean')
names(dataset)[15] <-paste('timeBodyAccelerationJerkZMean')

names(dataset)[16] <-paste('timeBodyAccelerationJerkXStd')
names(dataset)[17] <-paste('timeBodyAccelerationJerkYStd')
names(dataset)[18] <-paste('timeBodyAccelerationJerkZStd')

names(dataset)[19] <-paste('timeBodyGyroXMean')
names(dataset)[20] <-paste('timeBodyGyroYMean')
names(dataset)[21] <-paste('timeBodyGyroZMean')

names(dataset)[22] <-paste('timeBodyGyroXStd')
names(dataset)[23] <-paste('timeBodyGyroYStd')
names(dataset)[24] <-paste('timeBodyGyroZStd')

names(dataset)[25] <-paste('timeBodyGyroJerkXMean')
names(dataset)[26] <-paste('timeBodyGyroJerkYMean')
names(dataset)[27] <-paste('timeBodyGyroJerkZMean')

names(dataset)[28] <-paste('timeBodyGyroJerkXStd')
names(dataset)[29] <-paste('timeBodyGyroJerkYStd')
names(dataset)[30] <-paste('timeBodyGyroJerkZStd')


## 
names(dataset)[31] <-paste('timeBodyAccelerationMagnitudeMean')
names(dataset)[32] <-paste('timeBodyAccelerationMagnitudeStd')

names(dataset)[33] <-paste('timeGravityAccelerationMagnitudeMean')
names(dataset)[34] <-paste('timeGravityAccelerationMagnitudeStd')

names(dataset)[35] <-paste('timeBodyAccelerationJerkMagnitudeMean')
names(dataset)[36] <-paste('timeBodyAccelerationJerkMagnitudeStd')

names(dataset)[37] <-paste('timeBodyGyroMagnitudeMean')
names(dataset)[38] <-paste('timeBodyGyroMagnitudeStd')

names(dataset)[39] <-paste('timeBodyGyroJerkMagnitudeMean')
names(dataset)[40] <-paste('timeBodyGyroJerkMagnitudeStd')

names(dataset)[41] <-paste('forceBodyAccelerationXMean')
names(dataset)[42] <-paste('forceBodyAccelerationYMean')
names(dataset)[43] <-paste('forceBodyAccelerationZMean')

names(dataset)[44] <-paste('forceBodyAccelerationXStd')
names(dataset)[45] <-paste('forceBodyAccelerationYStd')
names(dataset)[46] <-paste('forceBodyAccelerationZStd')

names(dataset)[47] <-paste('forceBodyAccelerationXMeanFrequency')
names(dataset)[48] <-paste('forceBodyAccelerationYMeanFrequency')
names(dataset)[49] <-paste('forceBodyAccelerationZMeanFrequency')

names(dataset)[50] <-paste('forceBodyAccelerationJerkXMean')
names(dataset)[51] <-paste('forceBodyAccelerationJerkYMean')
names(dataset)[52] <-paste('forceBodyAccelerationJerkZMean')


names(dataset)[53] <-paste('forceBodyAccelerationJerkXStd')
names(dataset)[54] <-paste('forceBodyAccelerationJerkYStd')
names(dataset)[55] <-paste('forceBodyAccelerationJerkZStd')

names(dataset)[56] <-paste('forceBodyAccelerationJerkXMeanFrequency')
names(dataset)[57] <-paste('forceBodyAccelerationJerkYMeanFrequency')
names(dataset)[58] <-paste('forceBodyAccelerationJerkZMeanFrequency')


names(dataset)[59] <-paste('forceBodyGyroXMean')
names(dataset)[60] <-paste('forceBodyGyroYMean')
names(dataset)[61] <-paste('forceBodyGyroZMean')

names(dataset)[62] <-paste('forceBodyGyroXStd')
names(dataset)[63] <-paste('forceBodyGyroYStd')
names(dataset)[64] <-paste('forceBodyGyroZStd')


names(dataset)[65] <-paste('forceBodyGyroXMeanFrequency')
names(dataset)[66] <-paste('forceBodyGyroYMeanFrequency')
names(dataset)[67] <-paste('forceBodyGyroZMeanFrequency')


names(dataset)[68] <-paste('forceBodyAccelerationMagnitudeMean')
names(dataset)[69] <-paste('forceBodyAccelerationMagnitudeStd')
names(dataset)[70] <-paste('forceBodyAccelerationMagnitudeMeanFrequency')
names(dataset)[71] <-paste('forceBodyBodyAccelerationJerkMagnitudeMeanFrequency')
names(dataset)[72] <-paste('forceBodyBodyGyroMagnitudeMean')
names(dataset)[73] <-paste('forceBodyBodyGyroMagnitudeStd')
names(dataset)[74] <-paste('forceBodyBodyGyroJerkMagnitudeMean')
names(dataset)[75] <-paste('forceBodyBodyGyroJerkMagnitudeStd')


## Step 8: Create a tidydataset for exportation, with the average of each variable for each activity and each subject.
tidydata<-dataset%>%
  arrange(subjectID, labels, prepost) %>%
  group_by(subjectID, labels, prepost) %>%
  summarise_each(funs(mean))



write.table(tidydata, file='tidydata.txt', row.name = FALSE )

