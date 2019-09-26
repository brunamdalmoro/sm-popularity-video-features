---
title: "Exploratory Data Analysis"
author: "Bruna Martini Dalmoro"
output:
  html_document:
    keep_md: yes
---



## Initial exploratory data analysis

In this project we using a dataset contain visual and temporal features from 1820 videos uploaded to facebook between august an october 2015 collected by Trzci´nski and Rokita and the data are available in <http://ii.pw.edu.pl/~ttrzcins/facebook_dataset_2015.csv>.


```r
# Reading data
facebook_data <- readRDS("../data/processed/facebook_data.rds")
```


