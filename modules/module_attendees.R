## Attendees Module

## UI for Attendees Module
module_attendeesUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiAttendees'))
}

## server function for Attendees Module
module_attendees <- function(input, output, session, pool) {
  
  df_users <- dbReadTable(pool, 'users') %>%
    select(id, name) %>%
    mutate(grouping = substr(name, 1, 1))
  l_users <- split.data.frame(df_users, df_users$grouping)
  
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
                                                           tags$div(class = 'item-title', as.character(x['name']))
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
