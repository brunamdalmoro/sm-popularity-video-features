# Gather temporal features
library(tidyverse)

temporal_features <- readRDS("data/processed/temporal_features.rds")

temporal_features %>%
  gather(feature, value, views.1:likes.168, factor_key=TRUE) %>%
  separate(feature, c("feature", "time"), "[.]") -> temporal_features_long

write_rds(temporal_features_long, "data/processed/temporal_features_long.rds")
