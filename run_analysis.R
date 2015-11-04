# This is the code for the course project for 'Getting and Cleaning Data' with R. I've tried to include all information in comments
# for every operation, so everything is as clear as possible!

# CHANGE THE WORKING DIRECTORY TO FOLDER THAT CONTAINS THE FOLDER UCI HAR Dataset IF YOU WANT TO TEST!
# working_dir             <- "";
# setwd(working_dir)
# CHANGE THE WORKING DIRECTORY TO FOLDER THAT CONTAINS THE FOLDER UCI HAR Dataset IF YOU WANT TO TEST!

# Step 0: Including the required libraries (Enable row if you want to install plyr)
# install.packages("plyr"); 
library(plyr);

# Step 0.5: Setting filenames / directories / working directory
train_folder            <- "train/";
x_train_file            <- "x_train.txt";
y_train_file            <- "y_train.txt";
subject_train_file      <- "subject_train.txt";

test_folder             <- "test/"
x_test_file             <- "x_test.txt";
y_test_file             <- "y_test.txt";
subject_test_file       <- "subject_test.txt";

features_file           <- "features.txt";
activity_labels_file    <- "activity_labels.txt";



# Step 1: Input the tables into R, based on the aforementioned variables.
x_train_table           <- read.table(paste(train_gfolder,x_train_file, sep = ""));
y_train_table           <- read.table(paste(train_folder,y_train_file, sep = ""));
subject_train_table     <- read.table(paste(train_folder,subject_train_file, sep = ""));

x_test_table            <- read.table(paste(test_folder,x_test_file, sep = ""));
y_test_table            <- read.table(paste(test_folder,y_test_file, sep = ""));
subject_test_table      <- read.table(paste(test_folder,subject_test_file, sep = ""));

features                <- read.table(features_file);

activities              <- read.table(activity_labels_file)

# Step 2: Merges the training and the test sets to create one data set (first x, then y, then subject)
x_combined              <- rbind(x_train_table, x_test_table);                                         # Merge X_train and X_Test
y_combined              <- rbind(y_train_table, y_test_table);                                         # Merge Y_train and Y_Test
subject_combined        <- rbind(subject_train_table, subject_test_table);                             # Merge subject_train and subject_test

# Step 3: Extract only the measurements on the mean and standard deviation for each measurement. 
features_filtered       <- grep("-(mean|std)\\(\\)", features[, 2]);                                   # Retrieve only Mean and Standard Dev.
x_combined              <- x_combined[, features_filtered];                                            # Now make a subset of the required columns.
names(x_combined)       <- features[features_filtered, 2];                                             # The names function will be used to assign proper names to the columns.

# Step 4: Use descriptive activity names to name the activities in the data set
y_combined[, 1]         <- activities[y_combined[, 1], 2];                                             # Add names based on activity tables.
names(y_combined)       <- "Activity"                                                                  # The names function is used to add the column name.

# Step 5: Appropriately label the data set with descriptive variable names. 
names(subject_combined) <- "Subject"                                                                   # Assign the correct names through the name function
data_combined           <- cbind(x_combined, y_combined, subject_combined)                             # Combine all the data we have to one set.

# Step 6: From the data set in step 4 (5 ;-)), creates a second, independent tidy data set with the average of each variable for each activity and each subject.
independent_data_set    <- ddply(data_combined, .(Subject, Activity), function(x) colMeans(x[, 1:66])) # Two less columns, as we want Subject and Activity averages.

# Step 7: Write the data to a text file, so you can check the results! :-).
write.table(independent_data_set, "independent_tidy_data_set.txt", row.name=FALSE)                     # Write our results!
 
