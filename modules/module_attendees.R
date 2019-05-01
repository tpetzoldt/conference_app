## Attendees Module

## UI for Attendees Module
module_attendeesUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiAttendees'))
}

## server function for Attendees Module
module_attendees <- function(input, output, session) {
  output$uiAttendees <- renderUI({
    f7Card(title = 'Attendees',
           h4('attendees')
    )
  })
}
