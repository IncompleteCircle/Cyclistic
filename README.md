##  **Google Data Analytics Certification Course Capstone Project**

------------

**Creator:** S. Taheri <br/>
**Course:** Coursera - Google Data Analytics Professional Certificate <br/>
**Capstone Project Title:** 2020 Cyclistic Market Analytics Reports <br/>

------------

#### Abstract
This project is aimed at illustrating the usage of data analytics and the data analysis cycle through a business case study, provided by Coursera-Google’s data analytics professional certification course’s capstone project. The capstone is focused on developing an ad hoc descriptive analysis for a fictional company, Cyclistic, however the analysis is based on real world time series data provided by Divvy bike-sharing services in Chicago, Illinois.

------------
**Language:** R <br/>
**Packages:**
- devtools
- tidyr
- lubridate
- data.table
- dplyr
- ggplot2

------------

#### Published Report
The finished submitted report can be found in the file directory, [**report**](https://github.com/IncompleteCircle/Cyclistic/tree/main/report), titled *2020 Market Analytics Report.* <br/>
To read please click the link here to access it, [**2020 Cyclistic Market Analytics Report**](https://github.com/IncompleteCircle/Cyclistic/blob/main/report/Case%20Study%20Cyclists%20Marketing%20Analytics%20Report.pdf).

------------
#### Project Repository Structure
The project repository structure is designed around the logic of the data analysis six-phase structure. The exception is directory, **main**, where the directory is used to store as a main hub for running all of the other files at once. The project design was focused on using a modular top-down design for each sequential analysis phase. The **"Ask"** and **"Act"** phases are found directly in the report, repsectively in the beginning and at the end. <br/>
![image](https://user-images.githubusercontent.com/43623335/201227772-c50948bf-5f44-43fc-ae91-758043e42dc2.png)

**Directory:** [main](https://github.com/IncompleteCircle/Cyclistic/tree/main/main)
- **File**: [fd_00_main.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/main/fd_00_main.R)

**Directory:** [tools](https://github.com/IncompleteCircle/Cyclistic/tree/main/tools) <br/>
**Data Analysis Phase**: Prepare
- **Sub-Directory**: [process](https://github.com/IncompleteCircle/Cyclistic/tree/main/tools/process)
	- **File**: [fd_01_data_process_integrate_2020.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/tools/process/fd_01_data_process_integrate_2020.R)

**Data Analysis Phase**: Process
- **Sub-Directory**: [clean](https://github.com/IncompleteCircle/Cyclistic/tree/main/tools/clean)
	- **File**: [fd_02_data_clean_timedate_2020.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/tools/clean/fd_02_data_clean_timedate_2020.R)
	- **File**: [fd_03_data_clean_NAs_analysis_2020.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/tools/clean/fd_03_data_clean_NAs_analysis_2020.R)
	- **File**: [fd_04_data_clean_merge_2020.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/tools/clean/fd_04_data_clean_merge_2020.R)

**Data Analysis Phase**: Analyze
- **Sub-Directory**: [eda](https://github.com/IncompleteCircle/Cyclistic/tree/main/tools/eda)
	- **File**: [fd_05_eda_divvy_bike_2020.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/tools/eda/fd_05_eda_divvy_bike_2020.R)
	- **File**: [fd_06_eda_divvy_bike_2020.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/tools/eda/fd_06_eda_divvy_bike_2020.R)

**Data Analysis Phase**: Share
- **Sub-Directory**: [plot](https://github.com/IncompleteCircle/Cyclistic/tree/main/tools/plot)
	- **File**: [fd_07_plot_divvy_bike_2020.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/tools/plot/fd_07_plot_divvy_bike_2020.R)
	- **File**: [fd_08_plot_divvy-bike_2020.R](https://github.com/IncompleteCircle/Cyclistic/blob/main/tools/plot/fd_08_plot_divvy_bike_2020.R)

------------

**Directory:** [environment_data_src](https://github.com/IncompleteCircle/Cyclistic/tree/main/environment_data_src)
- **Description**: R environment data source. For users who want to investigate the processed, analyzed, and plotted data without having to run the main script.

**Directory:** [images](https://github.com/IncompleteCircle/Cyclistic/tree/main/images)
- **Description**: Data visualization directory that stores the finished plots that are used in the final report.
- **Sub Directory**: [geom_bar](https://github.com/IncompleteCircle/Cyclistic/tree/main/images/geom_bar)
	- **Description**: Stores the bar chart images that were developed with the ggplot2 package.
- **Sub Directory**: [geom_hist](https://github.com/IncompleteCircle/Cyclistic/tree/main/images/geom_hist)
	- **Description**: Stores the histogram images that were developed with the ggplot2 package.
	
------------

**Raw Data Source**: [2020 Divvy Bike Sharing Data](https://drive.google.com/drive/folders/1bDGiVeiac-Fc9gLqCTOEFHNntMtNsbbT)
