# Introduction

The script `run_analysis.R` performs the steps described in `README.md`

* First, I read in all the data into the environment from local files, using the features list and `grep` to avoid reading in unnecessary columns
* Use `rbind` and `cbind` to patch everthing together into one big data frame, `AllTogetherNow`
* I replace the numeric activity IDs with the corresponding labels from `activityLabels`
* Redefine `subject` and `activity` into factors to make later functions play nicer
* Lastly use `ddply` to get our means, grouped by activities and subjects and write the result to `DataMeans.txt`

# Variables

* `xtrain`, `ytrain`, `xtest`, `ytest`, `subjectTrain` and `subjectTest` are simply read in from local files.
* `train` and `test` are intermediate merged data sets.
* `features` contains the the names for the various data measurements, it is eventually used to provide column names for `AllTogetherNow`
* `AllTogetherNow` is a merge of `train` and `test` with column names from `features`
* `DataMeans` is a data frame of measurement averages grouped by activity and subject, which is then written to local memory as `DataFrames.txt`