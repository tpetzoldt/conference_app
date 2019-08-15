## Home Module

## UI for Home Module
module_homeUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiHome'))
}

## server function for Home Module
module_home <- function(input, output, session) {
  
  ns <- session$ns
    
  output$uiHome <- renderUI({
    buttons <- list (
      list(name = 'Schedule', icon = f7Icon('calendar_fill')),
      list(name = 'Attendees', icon = f7Icon('persons')), 
      list(name = 'Location', icon = f7Icon('placemark_fill')),
      list(name = 'Mixer', icon = f7Icon('chat_fill'))
    )
    f7Card(title = 'Home',
           tags$div(class = 'list inset',
                    
                    tags$ul(
                      tagList(
                        lapply(buttons, function(x) {
                          div(class = 'item-content',
                              div(class = 'item-media',
                                  f7Icon(x[['icon']])
                                  ),
                              div(class = 'item-inner',
                                  tags$a(href = '#', id = ns(paste('but', x, sep='_')), class = 'action-button item-link list-button', x[['name']])
                                  )
                              )
                          })
                        )
                      )
                    )
           )
  })

  observeEvent(input$but_Schedule, {
    tab_select(session, 'Schedule')
  })
  
  observeEvent(input$but_Attendees, {
    tab_select(session, 'Attendees')
  })
  
  observeEvent(input$but_Location, {
    tab_select(session, 'Location')
  })
  
  observeEvent(input$but_Mixer, {
    tab_select(session, 'Mixer')
  })
}
