## Feed Module

## UI for Feed Module
module_feedUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiFeed'))
}

## server function for Feed Module
module_feed <- function(input, output, session) {
  output$uiFeed <- renderUI({
    f7Card(title = 'Feed',
           h4('Welcome to R/Pharma'),
           p("This app is specifically designed for mobiles."),
           p("The app on the main rinpharma.com page will better suit larger devices.")
    )
  })
}
