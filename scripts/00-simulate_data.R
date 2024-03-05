#### Preamble ####
# Purpose: Simulates data for number of E/e's in a book
# Author: Sindhu Priya Mallavarapu, Jena Shah
# Date: 2024-03-01
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####

set.seed(9999)

#simulate the data with poisson distribution
e_sim <-
  tibble(
    # number of chapters
    chapter = c(rep(1, 20), rep(2, 20), rep(3, 20), rep(4, 20)),
    #number of lines
    line = rep(1:20, 4),
    num_words_in_line = runif(min = 0, max = 20, n = 80) |> round(0),
    # of e's
    num_e = rpois(n = 80, lambda = 20)
  )

#plot the data
e_sim |>
  ggplot(aes(y = num_e, x = num_words_in_line)) +
  geom_point() +
  labs(
    x = "Number of words in line",
    y = "Number of e/Es in the first ten lines"
  ) +
  theme_classic()


