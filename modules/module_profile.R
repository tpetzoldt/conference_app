## Profile Module


## demo user data
user_name <- 'bob'
user_email <- 'bob@bob.com'
user_image <- 'https://randomuser.me/api/portraits/men/32.jpg'
user_bio <- ''


## UI for Profile Module
module_profileUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiProfile'))
}

## server function for Profile Module
module_profile <- function(input, output, session) {
  
  ns <- session$ns
  
  output$uiProfile <- renderUI({
    f7Card(title = user_name,
           div(style = 'text-align: center;',
               tags$div(style = 'height: 80px; width: 80px; display: inline-block;',
                        tags$img(style='height: 100%; width: 100%; object-fit: contain', src=user_image)
                        ),
               br(),
               h3(user_name),
               h3(user_email)
               )
           )
  })

}
