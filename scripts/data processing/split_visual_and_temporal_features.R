# Split data in two: visual features and temporal features
library(tidyverse)

facebook_data <- readRDS("../data/raw/facebook_data.rds")

visual_features <- select(facebook_data, facebook_post_id:title.sentiment)
temporal_features <- select(facebook_data, facebook_post_id, views.1:likes.168)

write_rds(x = visual_features, path = "data/processed/visual_features.rds")
write_rds(x = temporal_features, path = "data/processed/temporal_features.rds")
