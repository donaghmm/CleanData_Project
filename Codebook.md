* **fn_activity_labels** : Filename for the Activity Labels
* **fn_features_labels** : Filename for the Features labels
* **fn_test_data** : Filename for the test dataset
* **fn_test_subjects** : Filename for the test dataset Subjects
* **fn_test_activity_ids** : Filename for the test dataset Activity IDs
* **fn_train_data** : Filename for the training dataset
* **fn_train_subjects** : Filename for the training dataset Subjects
* **fn_train_activity_ids** : Filename for the training dataset Activity IDs

* **df_activity_labels** : Dataframe storing the Activty Labels
* **df_features_labels** : Dataframe storing the Fetaures Labels - will be made unique if there are duplicates

* **df_test_data** : Dataframe storing the test dataset
* **df_test_subjects** : Dataframe storing the Subject IDs for the test dataset
* **df_test_activity_ids** : Dataframe storing the Activity IDs for the test dataset
* **df_test** : Dataframe combining columns from df_test_subjects and df_test_activity_ids and df_test_data

* **df_train_data** : Dataframe storing the training dataset
* **df_train_subjects** : Dataframe storing the Subject IDs for the training dataset
* **df_train_activity_ids** : Dataframe storing the Activity IDs for the training dataset
* **df_train** : Dataframe combining columns from df_train_subjects, df_train_activity_ids and df_train_data

* **df_merged_dataset** : Dataframe combining the rows from df_test and df_train. A new Column that contains the Activity Labels is added by merging with df_activity_labels using the common Activity id.
* **df_selected** : Dataframe that only contains the Subject ID, Activity, and fields that contain '.mean' or any fields that contain '.std'
* **df_tidy_dataset** : Dataframe that stores the mean by Subject and Activity
