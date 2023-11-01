#' amino_acid_plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_amino_acid_plot_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::textAreaInput(
        inputId = ns("peptide"),
        label = "Peptide sequence",
        width = 300,
        height = 100,
        placeholder = "Insert peptide sequence"
      )
      ),
      shiny::mainPanel(
        shiny::plotOutput(
          outputId = ns("abundance")
        )
      )
    )

  )
}

#' amino_acid_plot Server Functions
#'
#' @noRd
#' @import ggplot2
#' @import CD12
mod_amino_acid_plot_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide |>
          CD12::amino_acid_plot() +
          ggplot2::theme(legend.position = "none")
      }
    })

  })
}

## To be copied in the UI
# mod_amino_acid_plot_ui("amino_acid_plot_1")

## To be copied in the server
# mod_amino_acid_plot_server("amino_acid_plot_1")
