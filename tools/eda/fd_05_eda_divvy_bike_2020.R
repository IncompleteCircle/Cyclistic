#-----------------------------------------------------------------------
#Creator: SJT
#Date: 24 AUG 2022
#File: fd_05_eda_divvy_bike_2020
#File Designation Number: 05
#-----------------------------------------------------------------------
#Data Phase Section: Exploratory Data Analysis/Analyze
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
#Function: obtainCol_Names_Types
#-----------------------------------------------------------------------
#Arguments: someDF - Type: Data Frame
#
#Returns: col_types_and_names - Type: Data Frame
#
#Description:
# This function takes a data frame (parameter) then goes through each
# column and obtains the "identifier"/"name" and its relevant data type.
# Stores it into another data frame to return back to be used in the
# exploratory data analysis segment.
#-----------------------------------------------------------------------
obtainCol_Names_Types <- function(someDF){
  #check if package is installed and loaded.
  #If not, install and load.
  package_there <- require(lubridate)
  if (package_there != TRUE){
    install.packages("lubridate")
    library(lubridate)
  }
  
  col_types_and_names <- data.frame(col_names = colnames(someDF),
                                    col_class = 1:ncol(someDF))
  
  totCols <- ncol(someDF)
  iRow <- 1
  
  for(iRow in 1:totCols){
    if(is.POSIXlt(someDF[,iRow])){
      col_types_and_names[iRow, 2] <- "POSIXlt"
    } else if (is.POSIXt(someDF[,iRow])){
      col_types_and_names[iRow, 2] <- "POSIXt"
    } else{
    col_types_and_names[iRow, 2] <- class(someDF[,iRow])
    }
  }
  
  rm(iRow, totCols, package_there)
  return(col_types_and_names)
}#END FUNCTION

#-----------------------------------------------------------------------
#Function: printSomeSummaryStats
#-----------------------------------------------------------------------
#Arguments: someDF - Type: Data Frame
#
#Return: someList - Type: List
#
#Description:
# To streamline the process and save space, the function iterates
# through each data frame's column [field] and produces summary
# statistics.
#
# Returns a list that contains all sumamry statistics for each field 
# in the data frame that's passed into the function.
#-----------------------------------------------------------------------
printSomeSummaryStats <- function(someDF){
  index <- 1
  someList <- NULL
  for (index in 1:ncol(someDF)){
    currentField <- colnames(someDF[index])
    print(paste("Summary Statistics: ", currentField))
    print(summary(someDF[index]))
    cat("\n")
    someList[[index]] <- summary(someDF[index])
  }
  rm(index)
  return(someList)
} #END FUNCTION

#-----------------------------------------------------------------------
#Step 1: Obtain Column Names and Data Types
#-----------------------------------------------------------------------
col_names_and_types <- obtainCol_Names_Types(tbl_2020_divvy)
rm(obtainCol_Names_Types)

#-----------------------------------------------------------------------
#Step 2: Head and Tail of Data Frame
#-----------------------------------------------------------------------
print("=================================================================")
print("EDA | TABLE: HEAD - ROWS: 10")
print(head(tbl_2020_divvy[1:5], 10))
cat("\n")
print(head(tbl_2020_divvy[6:10], 10))
cat("\n")
print(head(tbl_2020_divvy[11:14],10))
cat("\n")
print("=================================================================")
print("EDA | TABLE: TAIL - ROWS: 10")
print(tail(tbl_2020_divvy[1:5], 10))
cat("\n")
print(tail(tbl_2020_divvy[6:10], 10))
cat("\n")
print(tail(tbl_2020_divvy[11:14],10))
print("=================================================================")
cat("\n")

#-----------------------------------------------------------------------
#Step 3: Summary Statistics
#-----------------------------------------------------------------------
list_summary_stats_tbl_2020_divvy <- printSomeSummaryStats(tbl_2020_divvy)
rm(printSomeSummaryStats)