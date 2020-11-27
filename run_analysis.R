# running analysis on wearable computer data

# set working directory
setwd("~/Desktop/getting_and_cleaning_data/")
curr <- getwd()
print(curr)

# get specific values from the given features on all axis
# item:3 getting only mean and standard deviation for each measurement
getDataFeatures <- function(list) {
  features <- data.frame()
  for (i in 1:length(list)){
    items <- strsplit(list[i], " ")
    unlisted <- unlist(items)
    asVector <- as.vector(as.numeric(unlisted))
    
    # getting tbody acceleration mean
    v1 <- asVector[1]
    v2 <- asVector[2]
    v3 <- asVector[3]
    # getting tbody acceleration standard deviation
    v4 <- asVector[4]
    v5 <- asVector[5]
    v6 <- asVector[6]
    # getting tbody gyro mean
    v7 <- asVector[121]
    v8 <- asVector[122]
    v9 <- asVector[123]
    # getting tbody gyro standard deviation
    v10 <- asVector[124]
    v11 <- asVector[125]
    v12 <- asVector[126]
    # getting fbody acceleration mean
    v13 <- asVector[266]
    v14 <- asVector[267]
    v15 <- asVector[268]
    # getting fbody acceleration standard deviation
    v16 <- asVector[269]
    v17 <- asVector[270]
    v18 <- asVector[271]
    
    # item:4 Appropriately labels the data set with descriptive variable names
    newRow <- data.frame(tbody_acceleration_mean_x=v1,
                         tbody_acceleration_mean_y=v2,
                         tbody_acceleration_mean_z=v3,
                         tbody_acceleration_sd_x=v4,
                         tbody_acceleration_sd_y=v5,
                         tbody_acceleration_sd_z=v6,
                         tbody_gyro_mean_x=v7,
                         tbody_gyro_mean_y=v8,
                         tbody_gyro_mean_z=v9,
                         tbody_gyro_sd_x=v10,
                         tbody_gyro_sd_y=v11,
                         tbody_gyro_sd_z=v12,
                         fbody_acceleration_mean_x=v13,
                         fbody_acceleration_mean_y=v14,
                         fbody_acceleration_mean_z=v15,
                         fbody_acceleration_sd_x=v16,
                         fbody_acceleration_sd_y=v17,
                         fbody_acceleration_sd_z=v18)
    features <- rbind(features, newRow)
  }
  return(features)
}

# mapping activity values to proper labels
replaceActivityLabels <- function(output) {
  output$activity[output$activity==1] <- "WALKING"
  output$activity[output$activity==2] <- "WALKING_UPSTAIRS"
  output$activity[output$activity==3] <- "WALKING_DOWNSTAIRS"
  output$activity[output$activity==4] <- "SITTING"
  output$activity[output$activity==5] <- "STANDING"
  output$activity[output$activity==6] <- "LAYING"
  return(output)
}

# read training data
train_subject <- readLines("dataset/train/subject_train.txt")
xtrain <- readLines("dataset/train/X_train.txt")
ytrain <- readLines("dataset/train/y_train.txt")

trainFeatures <- getDataFeatures(xtrain)
train_data <- data.frame(subject=train_subject, activity=ytrain)
train_data <- cbind(train_data, trainFeatures)

# read test data
test_subject <- readLines("dataset/test/subject_test.txt")
xtest <- readLines("dataset/test/X_test.txt")
ytest <- readLines("dataset/test/y_test.txt")

testFeatures <- getDataFeatures(xtest)
test_data <- data.frame(subject=test_subject, activity=ytest)
test_data <- cbind(test_data, testFeatures)

# item:1 merge test and train data
full_data <- rbind(test_data, train_data)

# item:3 Uses descriptive activity names to name the activities in the data set 
clean_full_data <- replaceActivityLabels(full_data)

print(head(clean_full_data, 2))