#### Preamble ####
# Purpose: Downloads and saves the data from "www.gutenberg.org"
# Author: Sindhu Priya Mallavarapu, Jena Shah
# Date: 2024-03-04
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(gutenbergr)
library(tidyverse)

#### Download data ####

#check how gutenbergr is setup so that we can find the right book
gutenberg_metadata

# filter for title = "Pride and Prejudice"
gutenberg_metadata |>
  filter(title == "Pride and Prejudice")

# get the right book using the gutenberg id

pnp <- gutenberg_download(
  gutenberg_id = 42671, 
  mirror = "ftp://ftp.ibiblio.org/pub/docs/books/gutenberg/" 
)


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(pnp, "inputs/data/raw_data.csv") 

         
