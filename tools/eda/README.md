### Directory: tools
#### Subdirectory: eda

------------

**Creator**: S. Taheri <br/>
**Last Update**: 28 AUG 2022 <br/>
**Data Analysis Phase**: Analyze

------------

**Language:** R <br/>
**IDE**: RStudio <br/>
**Packages Used**:
- lubridate
- data.table
- dplyr

------------

**Files Listed**
- fd_05_eda_divvy_bike_2020.R
- fd_06_eda_divvy_bike_2020.R

------------

#### File: fd_05_eda_divvy_bike_2020.R
**File Designation Number**: 05

**Description**: This file goes through the merged data frame from the previous data analysis cycle phase and explores the data. It provides the basic structure of the data frame from identifiers and data types. It prints for the user the head and tail of the data frame. Additionally, it provides summary statistics for all fields in the data frame and stores them into a R object named, *list_summary_stats_tbl_2020_divvy.*

------------

#### File: fd_06_eda_divvy_bike_2020.R
**File Designation Number**: 06

**Description**: This file is designed to provide a list of summary statistic tables to be used in the later stages of the data analysis cycle, specifically for data visualization. The file is sequenced into the following procedures by first performing a preliminary check on the data, then building the design of the summary statistics data frame. After constructing the fields and setting their data structures, the file populates the fields by calling relevant functions. A new table is created by the name of *tbl_2020_summary*, which contains a variety of summary statistics on the targeted fields. There are two additional tables constructed that store summary statistics on trips less than 24 hours and those greater than 24 hours. They are used later for the data visualization phase.

------------


