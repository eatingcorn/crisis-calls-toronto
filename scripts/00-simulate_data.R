#### Preamble ####
# Purpose: Simulates data for Crisis Calls from 2014-2023
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
    
    # Randomly pick an option's, with replacement, 1000 times
    Year = sample(2014:2023, 1000, replace = TRUE),
    
    # Randomly pick an option's, with replacement, 1000 times
    
    `Type of Event` = sample(
      x = c("Suicide-Related", 
            "Overdose", 
            "Person in Crisis"),
      size = 1000,
      replace = TRUE),
    
    # Randomly pick an option's, with replacement, 1000 times
    `Division` = sample(
      x = c("D11", "D12", "D13", 
            "D14","D22", "D23", "D31", "D32", 
            "D33","D41","D42", "D43", "D51", 
            "D52","D53", "D54/D55"),
      size = 1000,
      replace = TRUE),
    )

#### Test Simulated Data ####

# Check if there are 16 different divisions
simulated_data$Division %>% unique() %>% length() == 16

# Check if there are 5 different crime categories
simulated_data$`Type of Event` %>% unique() %>% length() == 3

# Check if minimum Year is 2014
simulated_data$Year %>% min() == 2014

# Check if maxiumum Year is 2023
simulated_data$Year %>% max() == 2023

# Check if data contains specific crimes
simulated_data$`Type of Event` %>% 
  unique() %>% 
  sort() == sort(c("Suicide-Related", "Overdose", "Person in Crisis"))

# Check if data contains specific divisions
simulated_data$Division %>% 
  unique() %>% 
  sort() == sort(c("D11", "D12", "D13", 
                   "D14","D22", "D23", "D31", "D32", 
                   "D33","D41","D42", "D43", "D51", 
                   "D52","D53", "D54/D55"))
