# Read .csv data and save .rds data
library(tidyverse)

facebook_dataset <- read_csv("data/raw/facebook_dataset_2015.csv") %>% 
  as_tibble() %>%
  # ajusting type of feature
  mutate(
    dominant_color.value = as.factor(dominant_color.value)
  ) %>%
  # rename features
  rename(
    dominant_color.histogram_0 = `dominant_color.histogram[0]`,
    dominant_color.histogram_1 = `dominant_color.histogram[1]`,
    dominant_color.histogram_2 = `dominant_color.histogram[2]`,
    dominant_color.histogram_3 = `dominant_color.histogram[3]`,
    dominant_color.histogram_4 = `dominant_color.histogram[4]`,
    dominant_color.histogram_5 = `dominant_color.histogram[5]`,
    dominant_color.histogram_6 = `dominant_color.histogram[6]`,
    dominant_color.histogram_7 = `dominant_color.histogram[7]`,
    dominant_color.histogram_8 = `dominant_color.histogram[8]`,
    dominant_color.histogram_9 = `dominant_color.histogram[9]`,
    shot_detection.transition_histogram_0 = `shot_detection.transition_histogram[0]`,
    shot_detection.transition_histogram_1 = `shot_detection.transition_histogram[1]` 
  ) %>%
  # remove nonvisual feature
  select(-title.sentiment)

write_rds(x = facebook_dataset, path = "data/raw/facebook_dataset.rds")
