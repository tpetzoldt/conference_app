## Location Module

## UI for Location Module
module_locationUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiLocation'))
}

## server function for Location Module
module_location <- function(input, output, session) {
  output$uiLocation <- renderUI({
    f7Card(title = 'Location: Googleplex',
           tags$iframe(src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3168.6391103405244!2d-122.08624618522607!3d37.42200414015092!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fba02425dad8f%3A0x6c296c66619367e0!2sGoogleplex!5e0!3m2!1sen!2s!4v1556736810690!5m2!1sen!2s", width="300", height="300", frameborder="0", style="border:0", allowfullscreen=FALSE)
           )
  })
}
