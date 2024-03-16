#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####

test_data <- read.csv("outputs/data/analysis_data.csv")

# make sure that we cleaned the data properly so that number of e's is an integer
test_data$count_e |> class() == 'integer'

# make sure we cleaned the data properly so that the word count is an integer
test_data$word_count |> class() == 'integer'

# make sure that we are only analyzing the lines where there are words
test_data$word_count |> min() > 0

test_data$count_e |> min() >= 0


