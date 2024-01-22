#### Preamble ####
# Purpose: Tests cleaned data set to ensure accuracy.
# Author: Ricky Fung
# Date: 23 January 2024
# Contact: ricky.fung@mail.utoronto.ca
# Pre-requisites: Run scripts "01-download_data.R" and "02-data_cleaning.R".


#### Workspace setup ####
library(tidyverse)

crime_cleaned_data <- read_csv("outputs/data/cleaned_crime_data.csv")



#### Test data ####

# Check if there are 16 different divisions
crime_cleaned_data$division %>% unique() %>% length() == 16

# Check if there are 5 different crime categories
crime_cleaned_data$crime_category %>% unique() %>% length() == 5

# Check if there are 8 different crimes
crime_cleaned_data$crime %>% unique() %>% length() == 8

# Check if minimum ID is 1
crime_cleaned_data$ID %>% min() == 1

# Check if data contains specific crime categories
crime_cleaned_data$crime_category %>% 
  unique() %>% 
  sort() == sort(c("Personal Offense", "Property Offense", 
                   "Controlled Substances", "Traffic Violation","Other"))

# Check if data contains specific crimes
crime_cleaned_data$crime %>% 
  unique() %>% 
  sort() == sort(c("Theft", "Break & Enter", "Robbery", "Fraud", "Assault", 
                   "Attempt Murder", "Sexual Violation", "Other"))

# Check if data contains specific divisions
crime_cleaned_data$division %>% 
  unique() %>% 
  sort() == sort(c("D11", "D12", "D13", 
                   "D14","D22", "D23", "D31", "D32", 
                   "D33","D41","D42", "D43", "D51", 
                   "D52","D53", "D55"))
