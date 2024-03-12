#### Preamble ####
# Purpose: Models Pride and Prejudice Data
# Author: Sindhu Priya Mallavarapu
# Date: March 11, 2024
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

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
  file = "outputs/models/pnp_model.rds"
)


