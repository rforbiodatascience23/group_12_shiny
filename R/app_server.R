#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import ggplot2
#' @import CD12
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_amino_acid_plot_server("amino_acid_plot_1")
  mod_DNA_transcription_server("DNA_transcription_1")
  }

