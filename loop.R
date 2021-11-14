# Source : https://bookdown.org/yihui/rmarkdown-cookbook/parameterized-reports.html

library(fivethirtyeight)
library(tidyverse)
library(rmarkdown)

# gérer le répertoire de destination (le créer au besoin)
dir.create(path = "output",
           showWarnings = FALSE)

# préparer la liste des id et l'identification de l'année

id <- bad_drivers$state
year <- 2021

# création du tibble pour générer les rapports

reports <- tibble(
  input = "report.Rmd",
  output_file = str_c("output/", id, "-driving-", format(Sys.time(), "%Y%m%d%l%M"), ".html"),
  params = map(id, ~list(id = . , year = year))
)

# génération du rapport en boucle avec pwalk.

reports %>%
  pwalk(render)
