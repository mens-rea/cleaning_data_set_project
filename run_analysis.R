# running analysis on wearable computer data

# set working directory
setwd("~/Desktop/getting_and_cleaning_data/")
curr <- getwd()
print(curr)

# get mean of every measurement
getMeanList <- function(list) {
  for (i in 1:length(list)){
    items <- strsplit(list[i], " ")
    unlisted <- unlist(items)
    asVector <- as.vector(as.numeric(unlisted)) ;
    result <- mean(asVector, na.rm=TRUE)
    sd <- sd(asVector, na.rm=TRUE)
    list[i] <- result
  }
  return(list)
}

# replace activity values with proper labels
replaceActivityLabels <- function(output) {
  output$activity[output$activity==1] <- "WALKING"
  output$activity[output$activity==2] <- "WALKING_UPSTAIRS"
  output$activity[output$activity==3] <- "WALKING_DOWNSTAIRS"
  output$activity[output$activity==4] <- "SITTING"
  output$activity[output$activity==5] <- "STANDING"
  output$activity[output$activity==6] <- "LAYING"
  return(output)
}

# create training data
train_subject <- readLines("dataset/train/subject_train.txt")
xtrain <- readLines("dataset/train/X_train.txt")
ytrain <- readLines("dataset/train/y_train.txt")

train_body_acc_x <- readLines("dataset/train/Inertial Signals/body_acc_x_train.txt")
train_body_acc_y <- readLines("dataset/train/Inertial Signals/body_acc_y_train.txt")
train_body_acc_z <- readLines("dataset/train/Inertial Signals/body_acc_z_train.txt")

train_body_gyro_x <- readLines("dataset/train/Inertial Signals/body_gyro_x_train.txt")
train_body_gyro_y <- readLines("dataset/train/Inertial Signals/body_gyro_y_train.txt")
train_body_gyro_z <- readLines("dataset/train/Inertial Signals/body_gyro_z_train.txt")

train_total_acc_x <- readLines("dataset/train/Inertial Signals/total_acc_x_train.txt")
train_total_acc_y <- readLines("dataset/train/Inertial Signals/total_acc_y_train.txt")
train_total_acc_z <- readLines("dataset/train/Inertial Signals/total_acc_z_train.txt")

trbax <- getMeanList(train_body_acc_x)
trbay <- getMeanList(train_body_acc_y)
trbaz <- getMeanList(train_body_acc_z)

trbgx <- getMeanList(train_body_gyro_x)
trbgy <- getMeanList(train_body_gyro_y)
trbgz <- getMeanList(train_body_gyro_z)

trtax <- getMeanList(train_total_acc_x)
trtay <- getMeanList(train_total_acc_y)
trtaz <- getMeanList(train_total_acc_z)

# read test data
test_subject <- readLines("dataset/test/subject_test.txt")
xtest <- readLines("dataset/test/X_test.txt")
ytest <- readLines("dataset/test/y_test.txt")

test_body_acc_x <- readLines("dataset/test/Inertial Signals/body_acc_x_test.txt")
test_body_acc_y <- readLines("dataset/test/Inertial Signals/body_acc_y_test.txt")
test_body_acc_z <- readLines("dataset/test/Inertial Signals/body_acc_z_test.txt")

test_body_gyro_x <- readLines("dataset/test/Inertial Signals/body_gyro_x_test.txt")
test_body_gyro_y <- readLines("dataset/test/Inertial Signals/body_gyro_y_test.txt")
test_body_gyro_z <- readLines("dataset/test/Inertial Signals/body_gyro_z_test.txt")

test_total_acc_x <- readLines("dataset/test/Inertial Signals/total_acc_x_test.txt")
test_total_acc_y <- readLines("dataset/test/Inertial Signals/total_acc_y_test.txt")
test_total_acc_z <- readLines("dataset/test/Inertial Signals/total_acc_z_test.txt")

tbax <- getMeanList(test_body_acc_x)
tbay <- getMeanList(test_body_acc_y)
tbaz <- getMeanList(test_body_acc_z)

tbgx <- getMeanList(test_body_gyro_x)
tbgy <- getMeanList(test_body_gyro_y)
tbgz <- getMeanList(test_body_gyro_z)

ttax <- getMeanList(test_total_acc_x)
ttay <- getMeanList(test_total_acc_y)
ttaz <- getMeanList(test_total_acc_z)

test_data <- data.frame(subject=test_subject, body_acceleration_x=tbax, body_acceleration_y=tbay, body_acceleration_z=tbaz, body_gyro_x=tbgx, body_gyro_z=tbgz, body_gyro_z=tbgz, total_acceleration_x=ttax, total_acceleration_y=ttay, total_acceleration_z=ttaz, activity=ytest)
train_data <- data.frame(subject=train_subject, body_acceleration_x=trbax, body_acceleration_y=trbay, body_acceleration_z=trbaz, body_gyro_x=trbgx, body_gyro_z=trbgz, body_gyro_z=trbgz, total_acceleration_x=trtax, total_acceleration_y=trtay, total_acceleration_z=trtaz, activity=ytrain)
full_data <- rbind(test_data, train_data)


# replace activity description
clean_test_data <- replaceActivityLabels(test_data)
clean_train_data <- replaceActivityLabels(train_data)
clean_full_data <- replaceActivityLabels(full_data)

sum_test <- summary(clean_test_data)
sum_train <- summary(clean_test_data)
sum_full <- summary(clean_full_data)
#print(tail(clean_test_data, 5))
#print(tail(clean_train_data, 5))
#print(tail(clean_full_data, 5))
#print(sum_test)
#print(sum_train)
#print(sum_full)