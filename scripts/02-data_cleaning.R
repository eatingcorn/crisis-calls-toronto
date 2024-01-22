#### Preamble ####
# Purpose: Cleans the raw crime data to improve readability.
# Author: Ricky Fung
# Date: 23 January 2024
# Contact: ricky.fung@mail.utoronto.ca
# Pre-requisites: Run script "01-download_data.R" and install janitor package.

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
crime_raw_data <- read_csv("inputs/data/crime_raw_data.csv")

# Clean column names
crime_reports_cleaned <- clean_names(crime_raw_data)

# Remove unused columns

crime_reports_cleaned <- crime_reports_cleaned %>% 
  
  # Remove unused columns
  select(`id`, `division`, `category`,`subtype`, `count`) %>% 
  
  # Remove unknown data
  filter(!grepl("NSA", division, ignore.case = TRUE)) %>% 
  
  # Rename Columns
  rename(`ID` = `id`, 
         `crime_category` = `category`, 
         `crime` = `subtype`,
         `report_count` = `count`) %>% 
  
  # Rename offence_category entries and group similar categories
  mutate(
    crime_category = case_match(
      crime_category,
      "Crimes Against the Person" ~ "Personal Offense",
      "Crimes Against Property" ~ "Property Offense",
      "Controlled Drugs and Substances Act" ~ "Controlled Substances",
      "Criminal Code Traffic" ~ "Traffic Violation",
      "Other Criminal Code Violations" ~ "Other",
      "Other Federal Statute Violations" ~ "Other")) %>% 
  
  # Rename crime entries and group similar crimes
  mutate(
    crime = case_match(
      crime,
      "Theft Over $5000" ~ "Theft",
      "Auto Theft" ~ "Theft",
      "Theft Under $5000" ~ "Theft",
      "Break & Enter-Commercial" ~ "Break & Enter",
      "Break & Enter-Apartment" ~ "Break & Enter",
      "Break & Enter-Other" ~ "Break & Enter",
      "Break & Enter-House" ~ "Break & Enter",
      "Robbery-Other" ~ "Robbery",
      "Robbery-Financial" ~ "Robbery",
      "Fraud" ~ "Fraud",
      "Assault" ~ "Assault",
      "Attempt Murder" ~ "Attempt Murder",
      "Sexual Violation" ~ "Sexual Violation",
      "Other Criminal Violations - Offensive Weapons" ~ "Other",
      "Other" ~ "Other"))
  
#### Save data ####
write_csv(crime_reports_cleaned, "outputs/data/cleaned_crime_data.csv")
