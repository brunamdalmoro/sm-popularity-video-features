library(tidyverse)
library(ggplot2)

options(scipen = 999)
set.seed(1234)

# Lendo os dados
dt <- readRDS("data/processed/visual_features_96h.rds")

dt %>%
  ggplot(aes(x = 1, y = (views_96))) +
  geom_boxplot()

# Separando os quartis
dt_resp <- dt %>%
  mutate(
    quartis = ntile(dt$views_96,4) %>% as.factor(),
    quartil_4 = ifelse(quartis == 4, 1, 0) %>% as.factor(),
    maior_1m = ifelse(views_96 >= 1000000, 1, 0) %>% as.factor()
  )

# Separando entre treino e teste
train <- dt_resp %>% sample_frac(.70)
test  <- anti_join(dt_resp, train, by = 'facebook_post_id')



# Ajustando árvore de decisão
library(rpart)
library(rpart.plot)

tree_general = rpart(quartis ~ 
                     general.duration +
                     general.fps +
                     general.frame_count +
                     general.frame_size.height, data=train, method = 'class')
rpart.plot(tree_general)


# Predicting the Validation set results
y_pred = predict(tree_general, newdata = test, type='class')

# Checking the prediction accuracy
table(test$Survived, y_pred) # Confusion matrix
error <- mean(test$Survived != y_pred) # Misclassification error
paste('Accuracy',round(1-error,4))
