# About Dataset

This dataset was made to showcase skills gained in the courset to gather and clean Data in R. This original dataset was comprised of measurements made for wearable technology. 
Since there was no specific instructions on what measurements to take apart from just getting mean and standard deviation values, I took only
18 values from the main measurements (x) and is identified by subject and activity (y). 

## About Data collection methodology

Since most of the input files were in text format, we had to use readLines to get their values per line, I then had to break the (X) value representing 
561 features per measurement. I created a function called **getDataFeatures**, to break down the features we use strsplit() function to turn them into a vector and to single out specific columns that 
we will need. I did these operations for both the test and train data to create 2 separate data frames from them. I later merged them into one dataset. 

I made sure to change activity values to string description of these values i.e. 1 - WALKING

I made sure to use descriptive variable names for all of the 18 measurements taken for this project

```
tbody_acceleration_mean_x=v1,
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
fbody_acceleration_sd_z=v18
```

### Description of the data

The data is stored in the dataset folder and was stored in a new dataset which took subject, activity and feature measurements. 

```
Give examples
Root Dir/
  -dataset/
    -test/
      -subject_test.txt
      -X_test.txt
      -y_test.txt
    -train
      -subject_train.txt
      -X_train.txt
      -y_train.txt
  -run_analysis.R
  -README.md

```

### And file formats

Input is in (.txt) and output is in (.csv).
```
-subject input, format txt.
-y input, format txt.
-x iunput, format txt.

```

## Online Repository link

* [DataRepository](https://www.kaggle.com/datasets) - Link to the data repository.

## Authors

* **Juan Miguel G. Alvarez** - *Initial work* - [mens-rea](https://github.com/mens-rea/)

## Acknowledgments

* I liked this project a lot, thanks coursera and John Hopkins for teaching me data science
