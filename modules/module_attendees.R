## Attendees Module

## UI for Attendees Module
module_attendeesUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiAttendees'))
}

## server function for Attendees Module
module_attendees <- function(input, output, session, df_users) {
  
  ns <- session$ns
  
  df.users <- df_users %>%
    mutate(grouping = substr(Name, 1, 1))
  l_users <- split.data.frame(df.users, df.users$grouping)
  

  output$uiAttendees <- renderUI({
    f7Card(title = 'Attendees',
           ## attendees list (framework 7 contact list)
           tags$div(class = 'list contacts-list',
                    tagList(
                      lapply(seq_along(l_users), function(i) {
                        tags$div(class = 'list-group',
                                 tags$ul(
                                   tags$li(class = 'list-group-title', names(l_users)[i]),
                                   tagList(
                                     apply(l_users[[i]], 1, function(x) {
                                       tags$li(
                                         tags$div(class = 'item-content',
                                                  tags$div(class = 'item-inner',
                                                           ## on click, update a shiny variable with the id of current selected user
                                                           tags$div(class = 'item-title', as.character(x['Phonebook']))
                                                           )
                                                  )
                                         )
                                       })
                                     )
                                   )
                                 )
                        })
                      )
                    )
           )
  })
  
}
