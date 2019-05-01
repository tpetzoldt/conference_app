## Location Module

## UI for Location Module
module_locationUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiLocation'))
}

## server function for Location Module
module_location <- function(input, output, session) {
  output$uiLocation <- renderUI({
    h4('location')
  })
}
