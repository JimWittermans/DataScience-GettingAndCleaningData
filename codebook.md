# Script steps

The R script that can be found in this folder executes a few steps to ultimately write a file that contains a new 'cleaned' and merged data set. I also included some other features to better understand R.

* If you want the working directory to be different than your current, you can comment out the 'working_dir' variable and insert the directory between the "". You can then unquote 'setwd(working_dir)' to let the script determine the working directory
* As this script uses the Plyr package, you'll need it to run the script. If you haven't installed the script, unquote the 'install.packages("plyr")' line and run it once. After, comment it out again.

* Step 0.5: Another feature of this script is the ability to determine the names of the files and folders. You can either leave the default values alone if you're executing the Course Project files! (rprog-034)
* Step   1: In the next step, we're reading all the files and saving them to variables using the read.table function.
* Step   2: In the next step, we're merging the data using 'rbind'. The x test and y test sets are combined, the x train and y train sets are combined and both subject sets are combined.
* Step   3: Then we'll only take the measurements we need, which is all except for mean and standard deviation (std). We're also adding features to the other sets.
* Step   4: We're then adding descriptive names to the combined y set, replacing vague column names with more readable ones.
* Step   5: We do the same as step four but then with the remaining column names for the x set and then combine the data altogether (x, y and subject)
* Step   6: Here we create the requested data set with the various averages, using the plyr package and ddplyr function.
* Step   7: In this last step we write our results to the text file called 'independent_tidy_data_set.txt'

# File variables

* train_folder		(Location of the folder with train files.)
* x_train_file		(The X train file name (and extension))
* y_train_file		(The Y train file name (and extension))
* subject_train_file	(The Subject train file name (and extension))

* test_folder		(Location of the folder with test files.)
* x_test_file		(The X test file name (and extension))
* y_test_file		(The Y test file name (and extension))
* subject_test_file	(The Subject test file name (and extension))

* features_file		(The name of the features file (and extension) - Note, this one has to be in the working directory)
* activity_labels_file  (The name of the activity labels file (and extension) - Note, this one has to be in the working directory)

# Table variables:
* x_train_table         (Table generated based on file x_train_file (and folder))
* y_train_table         (Table generated based on file y_train_file (and folder))
* subject_train_table   (Table generated based on file subject_train_file (and folder))

* x_test_table          (Table generated based on file x_test_file (and folder))
* y_test_table          (Table generated based on file y_test_file (and folder))
* subject_test_table    (Table generated based on file subject_test_file (and folder))

# Other variables:
* x_combined		(Combining train and test from x sets.)
* y_combined		(Combining train and test from y sets.)
* subject combined	(Combining train and test from subject sets.)
* features_filtered     (Filtering the unneeded columns from the features file)
* data_combined		(Combining all data together (Final step: x_combined, y_combined and subject_combined))
* independent_data_set	(Required for the tidy data set output.)	