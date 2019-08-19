## Mixer Module

## UI for Mixer Module
module_mixerUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiMixer'))
}

## server function for Mixer Module
module_mixer <- function(input, output, session) {
  output$uiMixer <- renderUI({
    f7Card(title = 'Location: CIC, 245 Main Street',
           tagList(
             tags$iframe(src = "https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d11791.06232309371!2d-71.10765130981851!3d42.3688348704331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e2!4m5!1s0x89e37744397bb925%3A0xcf4f795206016674!2sCGIS+South%2C+Cambridge+Street%2C+Cambridge%2C+MA!3m2!1d42.375015399999995!2d-71.11314759999999!4m5!1s0x89e370a5f1ab03d7%3A0xfb779aa756dd2e43!2s245+Main+St%2C+Cambridge%2C+MA+02142%2C+USA!3m2!1d42.3623694!2d-71.08486289999999!5e0!3m2!1sen!2s!4v1566243766817!5m2!1sen!2s", width="300", height="300", frameborder="0", style="border:0", allowfullscreen=FALSE),
             # tags$iframe(src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2948.068970592898!2d-71.08705158447505!3d42.36236937918669!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e37101a045d66b%3A0x364dd93841ff2be1!2sCIC+Cambridge!5e0!3m2!1sen!2s!4v1565820353412!5m2!1sen!2s", width="300", height="300", frameborder="0", style="border:0", allowfullscreen=FALSE),
             tags$hr(),
             tags$p('Mixer Thursday, August 22nd 6:00pm-7:30pm'),
             tags$p('Hosted by Metrum'),
             tags$p('Drinks and appetizers will be served'),
             tags$p('CIC Building, 245 Main Street, Cambridge (There are two other CIC buildings closeby - make sure you go to 245 Main Street!  This is a different location to last year\'s mixer)'),
             tags$p('Enter just outside Kendall T Station and take elevator to 2nd floor to check in with concierge. R/Pharma event on 3rd floor (Kitchen / Mosaic Room)'),
             tags$p(tags$b('Please remember to bring your conference badge and photo ID - you\'ll need it for entry'))
           )
           )
  })
}
