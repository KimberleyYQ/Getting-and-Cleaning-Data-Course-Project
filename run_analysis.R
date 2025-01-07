### Q1
### load the train data to R
subject_train <- read.table("/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/UCI HAR Dataset/train/X_train.txt")
###Combine them into a single data frame:
training_data <- cbind(subject_train, y_train, X_train)
###  Check the dimensions or view the first few rows:
dim(training_data)
head(training_data)

### load test data to R
subject_test <- read.table("/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/UCI HAR Dataset/test/X_test.txt")
###Combine them into a single data frame:
testing_data <- cbind(subject_test, y_test, X_test)
###  Check the dimensions or view the first few rows:
dim(testing_data)
head(testing_data)

# Check the column names of both datasets
names(training_data)
names(testing_data)

# Check the dimensions
dim(training_data)
dim(testing_data)

# Read the features file to get feature names
features <- read.table("/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/UCI HAR Dataset/features.txt", 
                       stringsAsFactors = FALSE, 
                       col.names = c("feature_id", "feature_name"))

# Assign column names to training_data
colnames(training_data) <- c("subject", "activity_id", features$feature_name)

# Assign column names to testing_data
colnames(testing_data) <- c("subject", "activity_id", features$feature_name)
# Merge training and test datasets
combined_data <- rbind(training_data, testing_data)

# Check the dimensions of the combined dataset
dim(combined_data)

# View the first few rows to ensure proper merging
head(combined_data)

print(dim(combined_data))
write.table(combined_data, file = "/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/combined_data.txt", row.name = FALSE)


### Q2
columns_to_keep <- grepl("subject|activity_id|mean\\(\\)|std\\(\\)", 
                         names(combined_data))
# Subset the data to keep only these columns
extracted_data <- combined_data[, columns_to_keep]

# Verify the resulting dimensions and column names
dim(extracted_data)
head(extracted_data)
names(extracted_data)


### Q3
# Load activity labels
setwd("/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project")
list.files()
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              col.names = c("activity_id", "activity_name"),
                              stringsAsFactors = FALSE)
# Merge the combined_data with activity_labels based on "activity_id"
duplicated_names <- names(combined_data)[duplicated(names(combined_data))]
print(duplicated_names)
# Ensure column names are unique
names(combined_data) <- make.unique(names(combined_data))
combined_data <- merge(combined_data, activity_labels, 
                       by = "activity_id", 
                       all.x = TRUE)
str(combined_data)
head(combined_data)

### Q4
# Remove parentheses for clarity
names(combined_data) <- gsub("\\()", "", names(combined_data))

# Replace prefixes
names(combined_data) <- gsub("^t", "Time", names(combined_data))        # t -> Time
names(combined_data) <- gsub("^f", "Frequency", names(combined_data))   # f -> Frequency

# Expand abbreviations
names(combined_data) <- gsub("Acc", "Accelerometer", names(combined_data))
names(combined_data) <- gsub("Gyro", "Gyroscope", names(combined_data))
names(combined_data) <- gsub("Mag", "Magnitude", names(combined_data))
names(combined_data) <- gsub("BodyBody", "Body", names(combined_data))  # fix duplicate "Body"

# Replace mean and std abbreviations
names(combined_data) <- gsub("-mean", "Mean", names(combined_data))
names(combined_data) <- gsub("-std", "STD", names(combined_data))

# Remove any remaining hyphens or special characters
names(combined_data) <- gsub("-", "", names(combined_data))

# View the first few column names to verify changes
head(names(combined_data))


### Q5
# Load dplyr
if (!require(dplyr)) {
  install.packages("dplyr")
}
library(dplyr)
names(combined_data)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              col.names = c("activity_id", "activity_name"),
                              stringsAsFactors = FALSE)

# Add a new column with descriptive activity names
combined_data$activity_name <- factor(combined_data$activity_id,
                                      levels = activity_labels$activity_id,
                                      labels = activity_labels$activity_name)


# Create the tidy dataset: average of each variable for each activity and subject
tidy_data <- combined_data %>%
  group_by(subject, activity_name) %>%
  summarise_all(mean)

# Save the tidy dataset to a file
write.table(tidy_data, file = "/Users/mac/Documents/Getting_and_Cleaning_Data/Peer-graded Assignment Getting and Cleaning Data Course Project/tidy_data.txt", row.name = FALSE)


