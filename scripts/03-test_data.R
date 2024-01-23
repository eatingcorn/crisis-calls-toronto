#### Preamble ####
# Purpose: Tests cleaned data set to ensure accuracy.
# Author: Ricky Fung
# Date: 23 January 2024
# Contact: ricky.fung@mail.utoronto.ca
# Pre-requisites: Run scripts "01-download_data.R" and "02-data_cleaning.R".


#### Workspace setup ####
library(tidyverse)

cleaned_data <- read_csv("outputs/data/cleaned_call_data.csv")


#### Test data ####

# Check if there are 16 different divisions
cleaned_data$Division %>% unique() %>% length() == 17

# Check if there are 5 different crime categories
cleaned_data$`Type of Event` %>% unique() %>% length() == 3

# Check if minimum Year is 2014
cleaned_data$Year %>% min() == 2014

# Check if maxiumum Year is 2023
cleaned_data$Year %>% max() == 2023

# Check if data contains specific crimes
cleaned_data$`Type of Event` %>% 
  unique() %>% 
  sort() == sort(c("Suicide-Related", "Overdose", "Person in Crisis"))

# Check if data contains specific divisions
cleaned_data$Division %>% 
  unique() %>% 
  sort() == sort(c("D11", "D12", "D13", 
                   "D14","D22", "D23", "D31", "D32", 
                   "D33","D41","D42", "D43", "D51", 
                   "D52","D53", "D54/D55", "NSA"))
