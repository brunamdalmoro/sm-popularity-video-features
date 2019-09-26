# Read .csv data and save .rds data
library(tidyverse)

facebook_data <- read_csv("data/raw/facebook_dataset_2015.csv") %>% as_tibble()

write_rds(x = facebook_data, path = "data/processed/facebook_data.rds")
