# Split data in two: visual features and temporal features
library(tidyverse)

facebook_dataset <- readRDS("data/raw/facebook_dataset.rds")

visual_features <- select(facebook_dataset, facebook_post_id:text_detection.average_text_frames)
temporal_features <- select(facebook_dataset, facebook_post_id, views.1:likes.168)

write_rds(x = visual_features, path = "data/processed/visual_features.rds")
write_rds(x = temporal_features, path = "data/processed/temporal_features.rds")
