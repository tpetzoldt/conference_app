## Home Module

## UI for Home Module
module_homeUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiHome'))
}

## server function for Home Module
module_home <- function(input, output, session) {
  output$uiHome <- renderUI({
    h4('home')
  })
}
