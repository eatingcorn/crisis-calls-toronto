#### Preamble ####
# Purpose: Simulates data for crime report tickets 
# to facilitate testing.
# Author: Ricky Fung
# Date: 23 January 2024
# Contact: ricky.fung@mail.utoronto.ca
# Pre-requisites: Install tidyverse.


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(302)

simulated_data <-
  tibble(
    # Use 1 through to 1000 to represent each ID
    ID = 1:1000,
    
    
    # Randomly pick an option, with replacement, 1000 times
    division = sample(
      x = c("D11", "D12", "D13", 
            "D14","D22", "D23", "D31", "D32", 
            "D33","D41","D42", "D43", "D51", 
            "D52","D53", "D55"),
      size = 1000,
      replace = TRUE),
    
    
    crime_category = sample(
      x = c("Personal Offense", "Property Offense", "Controlled Substances", 
            "Traffic Violation","Other"),
      size = 1000,
      replace = TRUE),
    
    # Randomly pick an option, with replacement, 1000 times
    crime = sample(
      x = c("Theft", "Break & Enter", "Robbery", "Fraud", "Assault", 
            "Attempt Murder", "Sexual Violation", "Other"),
      size = 1000,
      replace = TRUE),
    
    # Randomly pick a number from 1-25, with replacement, 1000 times
    report_count = sample(1:25, 1000, replace = TRUE)
    )

#### Test Simulated Data ####

# Check if there are 16 different divisions
simulated_data$division %>% unique() %>% length() == 16

# Check if there are 5 different crime categories
simulated_data$crime_category %>% unique() %>% length() == 5

# Check if there are 8 different crimes
simulated_data$crime %>% unique() %>% length() == 8

# Check if minimum ID is 1
simulated_data$ID %>% min() == 1

# Check if data contains specific crime categories
simulated_data$crime_category %>% 
  unique() %>% 
  sort() == sort(c("Personal Offense", "Property Offense", 
                   "Controlled Substances", "Traffic Violation","Other"))

# Check if data contains specific crimes
simulated_data$crime %>% 
  unique() %>% 
  sort() == sort(c("Theft", "Break & Enter", "Robbery", "Fraud", "Assault", 
                   "Attempt Murder", "Sexual Violation", "Other"))

# Check if data contains specific divisions
simulated_data$division %>% 
  unique() %>% 
  sort() == sort(c("D11", "D12", "D13", 
                   "D14","D22", "D23", "D31", "D32", 
                   "D33","D41","D42", "D43", "D51", 
                   "D52","D53", "D55"))

