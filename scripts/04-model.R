#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(marginaleffects)

#### Read data ####
pnp_data <- read_csv("outputs/data/analysis_data.csv")

### Model data ####
first_model <- stan_glm(
    count_e ~ word_count,
    data = pnp_data,
    family = poisson(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )




#### Save model ####
saveRDS(
  first_model,
  file = "pnp_model.rds"
)

#plot_predictions(first_model, condition = "word_count") +
#  labs(x = "Number of words",
#       y = "Average number of e/Es in the first 10 lines") +
#  theme_classic()


