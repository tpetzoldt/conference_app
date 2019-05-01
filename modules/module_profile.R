## Profile Module

## UI for Profile Module
module_profileUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiProfile'))
}

## server function for Profile Module
module_profile <- function(input, output, session) {
  output$uiProfile <- renderUI({
    f7Card(title = 'Profile',
           h4('profile')
    )
  })
}
