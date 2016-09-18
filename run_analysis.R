#This script requires the reshape2 package

#Read the test and training datasets.
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)

#Read the activity data of each dataset.
testact <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
trainact <- read.table("./UCI HAR Dataset/test/y_train.txt", header = FALSE)

#Read the subject data of each dataset.
xtestSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtrainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Rename the column of the subject data as "Activity".
colnames(testact) <- c("Activity")
colnames(trainact) <- c("Activity")

#Rename the column of the subject data as "Subject".
colnames(xtestSub) <- c("Subject")
colnames(xtrainSub) <- c("Subject")

#Add a "Subject" column to the datasets containing their respective subject data.
xtest <- cbind(xtestSub, xtest)
xtrain <- cbind(xtrainSub, xtrain)

#Add an "Activity" column to the datasets containing their respective activity data.
xtest <- cbind(testact, xtest)
xtrain <- cbind(trainact, xtrain)

#Merge the two datasets using rbind.
testNtrain <- rbind(xtest, xtrain)

#Sort by Activity then Subject.
testNtrain <- testNtrain[order(testNtrain[,"Activity"], testNtrain[,"Subject"]), ]

#Read the activity labels data.
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
actnames <- as.character(activities$V2)

#Replace the numeric representations of data in the Activity column with descriptive names from the activity labels.
testNtrain$Activity[testNtrain$Activity == 1] <- actnames[1]
testNtrain$Activity[testNtrain$Activity == 2] <- actnames[2]
testNtrain$Activity[testNtrain$Activity == 3] <- actnames[3]
testNtrain$Activity[testNtrain$Activity == 4] <- actnames[4]
testNtrain$Activity[testNtrain$Activity == 5] <- actnames[5]
testNtrain$Activity[testNtrain$Activity == 6] <- actnames[6]

#Read the features data.
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
ftnames <- as.character(features$V2)

#Rename the columns of the merged dataset with the feature data.
names(testNtrain)[3:563] = ftnames

#Make a subset selecting only the mean and standard deviation, and not forgetting the Subject column.
testNtrain <- subset(testNtrain, select = grep("Activity|Subject|mean\\(|std", names(testNtrain)))

#Use reshape to create a second, independent dataset with the average of each variable for each activity and subject.
df_melt <- melt(testNtrain, id = c("Activity", "Subject"))
testNtrain2 <- dcast(df_melt, Activity + Subject ~ variable, mean)

#Write the reshaped data into a text file.
write.table(testNtrain2, "./testNtrain2.txt", row.names = FALSE)