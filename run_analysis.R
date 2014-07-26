 # # 1.Merges the training and the test sets to create one data set.
   
   #load the features, data set
   setwd("D:\\Biostatistique\\john hopkings\\getdata\\projet\\UCI HAR Dataset")
   features <- read.table("features.txt", col.names=c("id","name"))
     #  load train data set
   #setwd("D:\\Biostatistque\\john hopkings\\getdata\\projet\\UCI HAR Dataset\\train")
train.set <- read.table("train\\X_train.txt", col.names=features$name)
train.labels <- read.table("train\\y_train.txt", col.names=c("activity.id"))
train.subject <- read.table("train\\subject_train.txt", col.names=c("subject.id"))

#load the test data
          #setwd("D:\\Biostatistque\\john hopkings\\getdata\\projet\\UCI HAR Dataset\\test")
          test.set <- read.table("test\\X_test.txt", col.names=features$name)
test.labels <- read.table("test\\y_test.txt", col.names=c("activity.id"))
test.subject <- read.table("test\\subject_test.txt", col.names=c("subject.id"))

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.

# SUBSET THE DATASETS
nm <- colnames(train.set)
mean_or_std <- grepl("(mean|std)\\.\\.", nm)  ## I don't include the meanFreq
train.subset <- train.set[mean_or_std]
test.subset <- test.set[mean_or_std]

# CREATE NEW VARIABLES
# Activity Id
train.subset$activity.id <- train.labels$activity.id
test.subset$activity.id <- test.labels$activity.id
# Subject Id
train.subset$subject.id <- train.subject$subject.id
test.subset$subject.id <- test.subject$subject.id
# Origin
train.subset$origin <- "train"
test.subset$origin <- "test"



# COMBINE THE DATASETS
data.sets <- rbind(train.subset,test.subset)

#4. Appropriately labels the data set with descriptive activity names.
# LOAD DATA
activity.labels <- read.table("activity_labels.txt", col.names=c("activity.id","activity.label"))
combo.sets <- merge(data.sets,activity.labels, by="activity.id")

  # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
meltname<- colnames(combo.sets)[!(names(combo.sets) %in% c("activity.id","subject.id","activity.label"))]

tidydata <- melt(combo.sets, id=meltname, measure.vars=c("activity.id","subject.id"))

combo.tidy <- dcast(tidydata, meltname ~ variable, mean)

 # SAVE THE TIDY DATASET
write.table(combo.tidy,"tidy.txt")
