## Location Module

## UI for Location Module
module_locationUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiLocation'))
}

## server function for Location Module
module_location <- function(input, output, session) {
  output$uiLocation <- renderUI({
    f7Card(title = 'Location: Tsai Auditorium',
           tags$iframe(src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2947.446253325018!2d-71.11540584882496!3d42.37563914200793!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e3774439604b6f%3A0xa97a48b31c00b85a!2sCenter+for+Government+and+International+Studies!5e0!3m2!1sen!2sde!4v1564428473037!5m2!1sen!2sde", width="300", height="300", frameborder="0", style="border:0", allowfullscreen=FALSE)
           )
  })
}
