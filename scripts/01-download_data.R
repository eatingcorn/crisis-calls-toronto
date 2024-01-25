#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto.
# Author: Ricky Fung
# Date: 23 January 2024
# Contact: ricky.fung@mail.utoronto.ca
# Pre-requisites: Install tidyverse and opendatatoronto packages.


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####


# get package
package <- show_package("persons-in-crisis-calls-for-service-attended")


# get all resources for this package
resources <- list_package_resources("persons-in-crisis-calls-for-service-attended")

# identify datastore resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample (this data seems to be missing observations, followed given)
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####

# downloaded the file and read
data <- read_csv(file = here::here("inputs/data/crisis_calls_raw.csv"))

write_csv(data, "inputs/data/crisis_calls_raw.csv") 

         
