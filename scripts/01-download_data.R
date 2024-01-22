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


package <- show_package("police-annual-statistical-report-reported-crimes")

# get all resources for this package
resources <- 
  list_package_resources("police-annual-statistical-report-reported-crimes")

# identify datastore resources
datastore_resources <- 
  filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####

write_csv(data, "inputs/data/crime_raw_data.csv") 

         
