## Location Module

## UI for Location Module
module_mixerUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiMixer'))
}

## server function for Location Module
module_mixer <- function(input, output, session) {
  output$uiMixer <- renderUI({
    f7Card(title = 'Location: CIC, 245 Main Street',
           tags$iframe(src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2948.068970592898!2d-71.08705158447505!3d42.36236937918669!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e37101a045d66b%3A0x364dd93841ff2be1!2sCIC+Cambridge!5e0!3m2!1sen!2s!4v1565820353412!5m2!1sen!2s", width="300", height="300", frameborder="0", style="border:0", allowfullscreen=FALSE)
           )
  })
}
