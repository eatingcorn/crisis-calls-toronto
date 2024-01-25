#### Preamble ####
# Purpose: Cleans the crisis call data to improve readability.
# Author: Ricky Fung
# Date: 23 January 2024
# Contact: ricky.fung@mail.utoronto.ca
# Pre-requisites: Run script "01-download_data.R" and install janitor package.

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
calls_raw_data <- read_csv("inputs/data/crisis_calls_raw.csv")

# Clean column names
crisis_calls_cleaned <- clean_names(calls_raw_data)

crisis_calls_cleaned <- crisis_calls_cleaned %>% 
  
  # Remove unused columns
  select(`event_year`, `event_type`, `division`) %>% 
  
  # # Merge D54 and D55 as D54 does not exist on Division map
  mutate(`division` = ifelse(`division` %in% c("D54", "D55"), "D54/D55", 
                           as.character(`division`))) %>% 

  # Rename Columns
  rename(`Year` = `event_year`,
         `Reason for Call` = `event_type`,
         `Division` = `division`)

#### Save data ####
write_csv(crisis_calls_cleaned, "outputs/data/cleaned_call_data.csv")


