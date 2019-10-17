Herewith, you can find detailed discription of processing steps, detailed explanation of each file and process to create tidy data set. 
# Summary
Samsung smartphone was having accelerometer. it was capturing movement of people by measureing movement in x and y directions. There are 30 peoples who have recorded 6 different activities.

# There are 561 observation in feature files. it shows different features 
str(feature)
'data.frame':	561 obs. of  2 variables:
 $ n        : int  1 2 3 4 5 6 7 8 9 10 ...
 $ functions: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ..
# there are 6 activities are given along with code.
 str(activity)
'data.frame':	6 obs. of  2 variables:
 $ code_number: int  1 2 3 4 5 6
 $ activity   : Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1
# subject_test is showing 2947 observation with volunter id.
table(subject_test$subject)
  2   4   9  10  12  13  18  20  24 
302 317 288 294 320 327 364 354 381 
## x_test is shwoing 2947 observation and 561 variables
## y_test is shwoing 2947 observation with activity code.
## subject_train is showing 7352 observation with colunter id
## x_train is showing 7352 observation with activity code
## y_train is shwoing 7352 observation with activity code.

## steps
set working directory to read downloaded file.
All following files read and given appropriate column names: features.txt,activity_labels.txt,subject_test.txt,X_test.txt,y_test.txt,subject_train.txt,X_train.txt,y_train.txt.
combine all files into single data frame.
extract only measurement which contains "mean" and "std", rest feature column were removed
group_by function were used to summarize data based on subject and activity_type variable. before using group_by and summarise fuction. i have downloaded dplyr library.
tidy data set created with file name summary_data.txt
