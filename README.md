Init
  Read test data, train data, features and activities

Step 1:
  Combine the test and train files to a data frame in the form of subjects, labels, the rest of the data.

Step 2:
  Filter features data to leave features that are either means ("mean()") or standard deviations ("std()").

Step 3:
  Uses descriptive activity names to name the activities in the data set

Step 4:
  Appropriately labels the data set with descriptive variable names.

Step 5:
    Create a new data frame by finding the mean for each combination of subject and label. It's done by aggregate() function

Final step:
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    Write the new tidy set into a text file called Tidy.txt, formatted similarly to the original files.
