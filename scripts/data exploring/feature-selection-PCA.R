### Exploring dimensionality reduction -----------------------------------------

# Seed
set.seed(1234)

# Options (remove scientific notation)
options(scipen = 999)

library(tidyverse)  # Clean, process, model, and visualize data
library(hrbrthemes) # Theme plots
library(qwraps2)    # Beautiful descriptive tables
library(factoextra) # PCA Analisys
library(rpart)      # Decision Trees
library(rpart.plot) # Decision Trees


# Reading data
visual_96 <- read_rds("data/processed/visual_features_96h.rds")


# All PCA
visual_pca_1 <- prcomp(
  visual_resp %>% 
    # remove id, categorical feature and response features
    select(-(facebook_post_id:dominant_color.value), -(views_96:maior_1m)),
  center = TRUE,
  scale = TRUE
)

visual_resp %>%
  bind_cols(visual_pca_1$x%>% as.data.frame()) -> visual_pca_dataset

# Colors PCA
visual_pca_2 <- prcomp(
  visual_resp %>% 
    select(dominant_color.histogram_1:dominant_color.histogram_9),
  center = TRUE,
  scale = TRUE
)

visual_resp %>%
  bind_cols(visual_pca_2$x%>% as.data.frame()) -> visual_pca_color

# print(visual_pca_1)
# 
# fviz_eig(visual_pca_1)
# 
# fviz_pca_var(visual_pca_1,
#              col.var = "contrib", # Color by contributions to the PC
#              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
#              repel = TRUE     # Avoid text overlapping
#              ) #%>% ggplotly()
# 
# # fviz_pca_ind(visual_pca_1,
# #              col.ind = "cos2", # Color by the quality of representation
# #              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
# #              geom = "point"
# #              ) %>% ggplotly()
# 
# # Eigenvalues
# eig_val_1 <- get_eigenvalue(visual_pca_1)
# eig_val_1
#   
# # Results for Variables
# res_var_1 <- get_pca_var(visual_pca_1)
# res_var_1$coord          # Coordinates
# res_var_1$contrib        # Contributions to the PCs
# res_var_1$cos2           # Quality of representation 
# # # Results for individuals
# # res_ind_1 <- get_pca_ind(visual_pca_1)
# # res_ind_1$coord          # Coordinates
# # res_ind_1$contrib        # Contributions to the PCs
# # res_ind_1$cos2           # Quality of representation 


## Exploring correlation with predictor features --

# PCs All features
cor.test(visual_pca_dataset$PC1,  visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC2,  visual_pca_dataset$views_96) #
cor.test(visual_pca_dataset$PC3,  visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC4,  visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC5,  visual_pca_dataset$views_96) #
cor.test(visual_pca_dataset$PC6,  visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC7,  visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC8,  visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC9,  visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC10, visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC11, visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC12, visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC13, visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC14, visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC15, visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC16, visual_pca_dataset$views_96)
cor.test(visual_pca_dataset$PC17, visual_pca_dataset$views_96)

# PCs Color features
cor.test(visual_pca_color$PC1, visual_pca_color$views_96)
cor.test(visual_pca_color$PC2, visual_pca_color$views_96)
cor.test(visual_pca_color$PC3, visual_pca_color$views_96)
cor.test(visual_pca_color$PC4, visual_pca_color$views_96)
cor.test(visual_pca_color$PC5, visual_pca_color$views_96)
cor.test(visual_pca_color$PC6, visual_pca_color$views_96)
cor.test(visual_pca_color$PC7, visual_pca_color$views_96)
cor.test(visual_pca_color$PC8, visual_pca_color$views_96)
cor.test(visual_pca_color$PC9, visual_pca_color$views_96)

#cor(visual_pca_dataset %>% select(-facebook_post_id,-dominant_color.value))


## Linear models -----

## Each feature
# PCs All features
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC1) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC2) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC3) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC4) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC5) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC6) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC7) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC8) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC9) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC10) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC11) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC12) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC13) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC14) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC15) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC16) %>% summary()
lm(visual_pca_dataset$views_96 ~ visual_pca_dataset$PC17) %>% summary()


## All features
# PCs All features
lm(visual_96$views_96 ~ 
     visual_pca_dataset$PC1 +
     visual_pca_dataset$PC2 +
     visual_pca_dataset$PC3 +
     visual_pca_dataset$PC4 +
     visual_pca_dataset$PC5 +
     visual_pca_dataset$PC6 +
     visual_pca_dataset$PC7 +
     visual_pca_dataset$PC8 +
     visual_pca_dataset$PC9 +
     visual_pca_dataset$PC10 +
     visual_pca_dataset$PC11 +
     visual_pca_dataset$PC12 +
     visual_pca_dataset$PC13 +
     visual_pca_dataset$PC14 +
     visual_pca_dataset$PC15 +
     visual_pca_dataset$PC16 +
     visual_pca_dataset$PC17) %>% summary()


## Each feature
# PCs Color features
lm(visual_pca_color$views_96 ~ visual_pca_color$PC1) %>% summary()
lm(visual_pca_color$views_96 ~ visual_pca_color$PC2) %>% summary()
lm(visual_pca_color$views_96 ~ visual_pca_color$PC3) %>% summary()
lm(visual_pca_color$views_96 ~ visual_pca_color$PC4) %>% summary()
lm(visual_pca_color$views_96 ~ visual_pca_color$PC5) %>% summary()
lm(visual_pca_color$views_96 ~ visual_pca_color$PC6) %>% summary()
lm(visual_pca_color$views_96 ~ visual_pca_color$PC7) %>% summary()
lm(visual_pca_color$views_96 ~ visual_pca_color$PC8) %>% summary()
lm(visual_pca_color$views_96 ~ visual_pca_color$PC9) %>% summary()

## Groupin features
# PCs Color features
lm(visual_pca_color$views_96 ~ 
     visual_pca_color$PC1 +
     visual_pca_color$PC2 +
     visual_pca_color$PC3 +
     visual_pca_color$PC4 +
     visual_pca_color$PC5 +
     visual_pca_color$PC6 +
     visual_pca_color$PC7 +
     visual_pca_color$PC8 +
     visual_pca_color$PC9 ) %>% summary()


## All features
# PCs Color features
lm(visual_pca_color$views_96 ~ -1 +
     visual_pca_color$general.duration +
     visual_pca_color$general.fps +
     visual_pca_color$general.frame_count +
     visual_pca_color$general.frame_size.height +
     visual_pca_color$PC1 +
     visual_pca_color$PC2 +
     visual_pca_color$PC3 +
     visual_pca_color$PC4 +
     visual_pca_color$PC5 +
     visual_pca_color$PC6 +
     visual_pca_color$PC7 +
     visual_pca_color$PC8 +
     visual_pca_color$PC9 +
     visual_pca_color$dominant_color.value +
     visual_pca_color$face_detection.average_face2frame_ratio + 
     visual_pca_color$face_detection.average_face_count_per_frame + 
     visual_pca_color$face_detection.average_face_present +
     visual_pca_color$text_detection.average_text2frame_ratio +
     visual_pca_color$text_detection.average_text_frames +
     visual_pca_color$shot_detection.average_shot_length + 
     visual_pca_color$shot_detection.shots_count + 
     visual_pca_color$shot_detection.transition_histogram_0 + 
     visual_pca_color$shot_detection.transition_histogram_1 +
     visual_pca_color$other.average_movie_speed +
     visual_pca_color$other.clutter_metric +
     visual_pca_color$rigidity.average_rigidity) %>% summary()

## Selected features
lm(visual_pca_color$views_96 ~ -1 +
     visual_pca_color$general.duration +
     visual_pca_color$general.fps +
     # visual_pca_color$general.frame_count +
     visual_pca_color$general.frame_size.height +
     visual_pca_color$PC1 +
     visual_pca_color$PC2 +
     visual_pca_color$PC3 +
     visual_pca_color$PC4 +
     visual_pca_color$PC5 +
     visual_pca_color$PC6 +
     visual_pca_color$PC7 +
     visual_pca_color$PC8 +
     visual_pca_color$PC9 +
     # visual_pca_color$dominant_color.value +
     # visual_pca_color$face_detection.average_face2frame_ratio + 
     # visual_pca_color$face_detection.average_face_count_per_frame + 
     # visual_pca_color$face_detection.average_face_present +
     # visual_pca_color$text_detection.average_text2frame_ratio +
     visual_pca_color$text_detection.average_text_frames +
     # visual_pca_color$shot_detection.average_shot_length + 
     # visual_pca_color$shot_detection.shots_count + 
     # visual_pca_color$shot_detection.transition_histogram_0 + 
     # visual_pca_color$shot_detection.transition_histogram_1 +
     # visual_pca_color$other.average_movie_speed +
     # visual_pca_color$other.clutter_metric +
     visual_pca_color$rigidity.average_rigidity) %>% summary()

