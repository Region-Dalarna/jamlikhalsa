## Globala inställningar för Shinyappen: jamlikhalsa

# Ladda nödvändiga paket
library(shiny)
library(shinyjs)
library(shinyWidgets)
library(DT)
library(ggiraph)
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)
library(rdshinyappar)

telemetry <- skapa_telemetry("jamlikhalsa")

# Allmänna options - TRUE = visa inte R-felmeddelanden i appen,
# FALSE = visa felmeddelanden från R på webben
options(shiny.sanitize.errors = TRUE)

rdpostgres::oppnadata_hamta()

rdpostgres::postgres_lista_scheman_tabeller() #ladda hem $karta

### KARTOR
# lm = lantmäteriet, för koroplet kan jag använda scb

library(DBI)
bef_df <- tbl(
  rdshinyappar::shiny_uppkoppling_las("oppna_data"),
  dbplyr::in_schema("scb", "totfolkmangd")
) %>%
  collect()
