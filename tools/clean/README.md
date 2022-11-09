### Directory: tools
#### Subdirectory: clean

------------

**Creator**: S. Taheri <br/>
**Last Update**: 20 AUG 2022 <br/>
**Data Analytics Phase**: Process

------------

**Language**: R <br/>
**IDE**: RStudio <br/>
**Packages Used**:
- tidyr

------------

**Files Listed**
- fd_02_data_clean_timedate_2020.R
- fd_03_data_clean_NAs_analysis_2020.R
- fd_04_data_clean_merge_2020.R

------------

#### File: fd_02_data_clean_timedate_2020.R
**File Designation Number**: 02

**Description**: This file is designed to implement data validation and cleaning procedures. The focus is set on the fields "started_at" and "ended_at", where they respectively list the start and end time stamps of a given trip. The script will investigate the data frames through built-in functions and validate that the records are logically correct. Errors are corrected by swapping the invalid inputs into their proper field.

------------
#### File: fd_03_data_clean_NAs_analysis_2020.R
**File Designation Number**: 03

**Description**: This file provides the user a breakdown of the missing (N/A) data rows that are detected for each field, per month (April-December 2020). This file is optional to run and is targeted in providing insight on the data prior to cleaning procedures are implemented. Its focus is to provide relevant stakeholders with additional information on the data sets prior to further analysis. To run this script successfully, please run fd_01_data_process_integrate_2020.R, so that the required R objects are available in the environment pane for usage.


------------

#### File: fd_04_data_clean_merge_2020.R
**File Designation Number**: 04

**Description**: This file merges all of the data frames post data processing and cleaning procedures. It merges the data frames for the months to April to December 2020 into a single data frame. This new merged data frame will be the base master data for year 2020.


------------
![image](https://user-images.githubusercontent.com/43623335/200710578-e3172245-e3fc-4fad-bcbd-abc0791e15cd.png)


