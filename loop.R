library(fivethirtyeight)
library(tidyverse)
library(rmarkdown)

state <- bad_drivers$state

reports <- tibble(
  input = "report.Rmd",
  output_file = stringr::str_c("output/", state, "-driving.html"),
  params = map(state, ~list(state = .))
)

reports %>%
  pwalk(render)

