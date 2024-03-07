#### Preamble ####
# Purpose: Cleans the pride and prejudice data
# Author: Sindhu Priya Mallavarapu, Jena Shah
# Date: 2024-03-05
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca
# License: MIT
# change theme

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")

pnp <- read_csv(
  "inputs/data/raw_data.csv",
  col_types = cols(
    gutenberg_id = col_integer(),
    text = col_character()
  )
)

###### TO DOOOOOOO ######################
pnp_reduced <-
  pnp |>
  filter(!is.na(text)) |> # Remove empty lines
  mutate(chapter = if_else(str_detect(text, "CHAPTER") == TRUE,
                           text,
                           NA_character_)) |> # Find start of chapter
  fill(chapter, .direction = "down") |> 
  mutate(chapter_line = row_number(), 
         .by = chapter) |> # Add line number to each chapter
  filter(!is.na(chapter), 
         chapter_line %in% c(2:11)) |> # Remove "CHAPTER I" etc
  select(text, chapter) |>
  mutate(
    chapter = str_extract_all(chapter, "([IVX]+)"),
    #chapter = str_remove(chapter, "CHAPTER "),
    #chapter = str_remove(chapter, ". "),
    #chapter = str_remove(chapter, "—CONCLUSION"),
    #chapter = as.integer(as.roman(chapter))
    #chapter = c("X" = 10)
    #chapter = as.integer(as.roman(chapter))
  ) |> # Isolate chapter numbers (strings of roman numerals)
  mutate(count_e = str_count(text, "e|E"),
         word_count = str_count(text, "\\w+")
         # From: https://stackoverflow.com/a/38058033
  ) 

pnp_reduced |>
  select(chapter, word_count, count_e, text) |>
  head()

#### Save data ####
write_csv(pnp_reduced, "outputs/data/analysis_data.csv")
