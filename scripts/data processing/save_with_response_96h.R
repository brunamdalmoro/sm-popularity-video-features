library(tidyverse)

visual_features <- readRDS("data/processed/visual_features.rds")
temporal_features <- readRDS("data/processed/temporal_features.rds")

visual_features %>%
  left_join(temporal_features %>% select(facebook_post_id, views_96 = views.96),
            by = "facebook_post_id") -> visual_features_96h

write_rds(visual_features_96h, "data/processed/visual_features_96h.rds")
