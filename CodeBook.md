CodeBook for GetData project
=========================================

This dataset originally came from the UCI Human Activity Recognition dataset.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.


WHAT I MAKE IS THAT:

load the features, data set
load train data set
load the test data
Create new variable activity.id and subject.id
Extracts the measurements on the mean and standard deviation for each measurements
COMBINE THE DATASETS (train and test)
Read the activity_labels.txt and merge it with the combine data sets
Use the librart reshspe2 and create melty data
Create the tidy data with the cast function
