library(dplyr)
setwd("./downloads/UCI HAR Dataset")
fn_activity_labels = "activity_labels.txt"
df_activity_labels <- read.table(fn_activity_labels, header = FALSE, sep = " ")
fn_features_labels = "features.txt"
df_features_labels <- read.table(fn_features_labels, header = FALSE, sep = " ")
df_features_labels <- make.names(df_features_labels[,2], unique = TRUE)


#TEST FILE PROCESSING
fn_test_data = "test/X_test.txt"
fn_test_subjects = "test/subject_test.txt"
fn_test_activity_ids = "test/Y_test.txt"

df_test_data <- read.table(fn_test_data, header = FALSE)
df_test_subjects <- read.table(fn_test_subjects, header = FALSE, sep = "")
df_test_activity_ids <- read.table(fn_test_activity_ids, header = FALSE, sep = "")

# Adding the Feature labels to the main Test data file
colnames(df_test_data) <- df_features_labels

#MERGING Subject and Activty files and add the Column Names
df_test <- cbind(df_test_subjects,df_test_activity_ids)
colnames(df_test) <-c("Subject_ID","Activity_ID")

# Merging in the Test Data Columns 
df_test <- cbind(df_test, df_test_data)



# TRAINING FILE PROCESSING
fn_train_data = "train/X_train.txt"
fn_train_subjects = "train/subject_train.txt"
fn_train_activity_ids = "train/Y_train.txt"

df_train_data <- read.table(fn_train_data, header = FALSE)
df_train_subjects <- read.table(fn_train_subjects, header = FALSE, sep = "")
df_train_activity_ids <- read.table(fn_train_activity_ids, header = FALSE, sep = "")

# Adding the Feature labels to the main Training data file
colnames(df_train_data) <- df_features_labels

#MERGING Subject and Activty files and adding Column Names
df_train <- cbind(df_train_subjects,df_train_activity_ids)
colnames(df_train) <-c("Subject_ID","Activity_ID")

# Merging in the Training Data Columns
df_train <- cbind(df_train, df_train_data)


# Merge the Test Data and Training Data
df_merged_dataset <- rbind(df_test,df_train)


# Add a new Column that contains the Activity Labels by merging with activity labels dataframe using the common Activity id.
df_merged_dataset = merge(df_merged_dataset,df_activity_labels,by.x = "Activity_ID",by.y = "V1",all=TRUE)

# Create a dataframe that only contains the Subject ID, Activity, and fields that contain '.mean' or any fields that contain '.std'
df_selected = select(df_merged_dataset,contains("Subject_ID"),contains("V2"), contains('.mean'), contains('.std'))

#creates a tidy dataset by Subject and By Activity
fby1 <- factor(df_selected$Subject_ID)
fby2 <- factor(df_selected$V2)
df_selected_ncols <- ncol(df_selected)
df_tidy_dataset = aggregate(df_selected[,3:(df_selected_ncols-2)], by=list(Subject=fby1,Activity=fby2), mean)

# Write out the Tidy Dataframe as a file
write.table(df_tidy_dataset,file="TidyFile.txt",row.names=FALSE, sep = "\t")