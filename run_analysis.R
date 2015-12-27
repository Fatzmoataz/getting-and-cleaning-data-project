############### Downloading the data ###################
## Creating a directory for data if such a directory does not exist
if(!file.exists("./data")){dir.create("./data")}
## Downloading the data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "./data/Dataset.zip", method = "curl")
## Unzipping the data
unzip("./data/Dataset.zip",exdir="./data")

############## Reading the features ####################
## Reading the features into a data frame
features <- read.table("./data/UCI HAR Dataset/features.txt",stringsAsFactors = FALSE,colClasses=c("NULL",NA))
## Transforming the features into a vector
features <- features[,1]
## Obtaining the indexes of the vector features measuring mean or standard deviation
FeaturesIndexes <- which(grepl("mean\\(",features) | grepl("std",features))

############# Creating a data frame for the test data #######
##### Reading the data
## Measurments
X_test <- scan("./data/UCI HAR Dataset/test/X_test.txt") 
## Subject_id
subject_test <- scan("./data/UCI HAR Dataset/test/subject_test.txt") 
## Activity
y_test <- scan("./data/UCI HAR Dataset/test/y_test.txt") 

####### Creating a first data frame with the subject id and the activity
tidyData_test <- data.frame(Subject_id=subject_test, Activity=y_test)

####### Adding to tidyData_test columns of the features containing mean or sd
k <- length(y_test)
j <- length(features)
#### For each feature containing mean or sd, measurments are extracted from  X_test and used to create a vector which is added to the tidyData_test as a column 
for (i in FeaturesIndexes){
        CosideredIndexes <- ((0:(k-1))*j)+i
        New_vector <- X_test[CosideredIndexes]
        tidyData_test[,features[i]] <- New_vector 
}
## releasing memory
rm(X_test)




############# Creating a data frame for the training data #######
##### Reading the data
## Measurments
X_train <- scan("./data/UCI HAR Dataset/train/X_train.txt") 
## Subject_id
subject_train <- scan("./data/UCI HAR Dataset/train/subject_train.txt") 
## Activity
y_train <- scan("./data/UCI HAR Dataset/train/y_train.txt")

####### Creating a first data frame with the subject id and the activity
tidyData_train <- data.frame(Subject_id=subject_train, Activity=y_train)
#### For each feature containing mean or sd, measurments are extracted from  X_test and used to create a vector which is added to the tidyData_train as a column 
k <- length(y_train)
j <- length(features)
for (i in FeaturesIndexes){
        CosideredIndexes <- ((0:(k-1))*j)+i
        New_vector <- X_train[CosideredIndexes]
        tidyData_train[,features[i]] <- New_vector 
}
## releasing memory
rm(X_train)

############## combining tidyData_test and tidyData_train together to obtain one data frame
tidyData <- rbind(tidyData_test,tidyData_train)

############## Naming the activities ##########################
## Reading the activity labels and creating a vector out of them
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE,colClasses=c("NULL",NA))
activity_labels <- activity_labels[,1]
## Renaming the activities with their labels
tidyData$Activity <- factor(tidyData$Activity, labels= activity_labels)


############### Renaming the columns ########################
## for each column of tidydata, we renae it removing the parentheisis and replacing the score by an underscore, e.g., fBodyAccelerometerJerk-mean()-X becomes fBodyAccelerometerJerk_mean_X 
names <- names(tidyData)
for (i in names[3:length(names)]){
        name <- gsub("-","_",i)
        name <- gsub("\\(\\)","",name)
        names(tidyData)[which(names(tidyData)==i)]= name
}


############## Summarizing the data
library(dplyr)
## Grouping the data by Activity and Subject
tidyData$Subject_id <- factor(tidyData$Subject_id)
tidyData <- group_by(tidyData,Activity,Subject_id)
## Obtaining the mean for every activity and every subject
summarized_data <- summarize_each(tidyData, funs(mean))
## Writing the tidy data into a file
write.table(summarized_data,"tidy_data.txt",row.name=FALSE)


