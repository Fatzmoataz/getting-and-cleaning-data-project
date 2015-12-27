### CodeBook for the Getting and Cleaning Data Course Project

## Project Description


The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 
 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Original Data


The original data set used in this project is taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
Its full description is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .


The data contains measurements obtained from experiments carried out with a group of 30 people. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. The measurements concern features of the triaxial acceleration, the triaxial body acceleration, and the triaxial angular velocity. The dataset is partitioned into two sets: training data and test data.


## Cleaning the data


To clean the data, the following transformations have been applied to the original data set (run_analysis.R is the script containing the code of the transformations).

1- The test data has been read into a data frame called tidyData_test. First, two columns (Subject_id and Activity) were added to tidyData_test. Afterwards, features containing measurements on the mean and standard deviation have been included as columns of tidyData_test.

2- The training data has been read into a data frame called trainData_test. First, (Subject_id and Activity) were added to trainData_test. Afterwards, features containing measurements  on the mean and standard deviation have been included as columns of tidyData_test.

3- The two data frames tidyData_test and trainData_test were merged into a data frame called tidyData.

4- The column of Activity in tidyData has been transformed to contain, instead of numbers, labels of the activities.

5- The names of the columns of tidyData have been transformed: for each column name, parenthesis have been removed and scores have been replaced by underscores, e.g., fBodyAccelerometerJerk-mean()-X has been replaced fBodyAccelerometerJerk_mean_X

6- A new data frame called summarized_data had been created from tidyData independent by taking the average of each variable for each activity and each subject.

7- summarized_data has been saved in a file “tidy_data.txt”

## Description of the tidy data

The tidy data stored in “tidy_data.txt” contains 68 variables and 180 measurements. The variables are as follows:

- Activity : Activity performed by the volunteer                    
- Subject_id : Identity of the volunteer (integer)

and then for each of the X, Y, and Z axes (referred to as axis) and each of the mean and standard deviation measures (referred to as measure)
- tBodyAcc_measure_axis :  “measure” of body acceleration time domain signal on “axis“            
- tGravityAcc_measure_axis :  “measure” of gravity acceleration time domain signal on “axis“ 
- tBodyAccJerk_measure_axis : “measure” of gravity acceleration jerk time domain signal on “axis“   
- tBodyGyro_measure_axis : “measure” of body angular velocity time domain signal on “axis“       
- tBodyGyroJerk_measure_axis :  “measure” of body angular velocity jerk time domain signal on “axis“
- tBodyAccMag_measure : “measure” of the magnitude of body acceleration time domain signal                   
- tGravityAccMag_measure : “measure” of the magnitude of gravity acceleration time domain signal
- tBodyAccJerkMag_measure : “measure” of the magnitude of body acceleration jerk time domain signal       
- tBodyGyroMag_measure : “measure” of the magnitude of body angular velocity time domain signal        
- tBodyGyroJerkMag_measure :  “measure” of the magnitude of body angular velocity jerk time domain signal       
- fBodyAcc_measure_axis :  “measure” of body acceleration frequency domain signal on “axis“         
- fBodyAccJerk_measure_axis : “measure” of body acceleration jerk frequency domain signal on “axis“       
- fBodyGyro_measure_axis :  “measure” of body angular velocity frequency domain signal on “axis“                       
- fBodyAccMag_measure : “measure” of the magnitude of body acceleration frequency domain signal                
- fBodyBodyAccJerkMag_measure : “measure” of the magnitude of body acceleration jerk frequency domain signal   
- fBodyBodyGyroMag_measure :  “measure” of the magnitude of body angular velocity frequency domain signal                             
- fBodyBodyGyroJerkMag_measure : “measure” of the magnitude of body angular velocity jerk frequency domain signal  