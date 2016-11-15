## scratch pad for code to rename files exported by photos
library(stringr)
library(tidyverse)

## rename first wave to have 3 digit number vs 2
fig_files <- list.files(pattern = "lego-rstats.*\\.jpg$")
file.rename(fig_files, str_replace(fig_files, "(\\d{2})", "0\\1"))

## remove prematurely-made "smaller" files
smaller_files <- list.files(pattern = "lego2.*smaller")
file.remove(smaller_files)

## main rename for second wave
df <- tibble(
  new_files = list.files(pattern = "lego2"),
  number = as.integer(str_replace(new_files, "lego2 - (\\d{1,2}).jpg", "\\1")),
  padded =  sprintf("%03d", number + 100),
  new_name = str_c("lego-rstats_", padded, ".jpg")
)
df %>%
  select(from = new_files, to = new_name) %>%
  pmap(file.rename)
