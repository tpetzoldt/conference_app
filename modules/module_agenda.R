## Agenda Module

## UI for Agenda Module
module_agendaUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiAgenda'))
}

## create a dummy agenda
df.agenda <- data.frame(
  day = rep(paste0('2019-08-', 21:23), each=5),
  time = rep(paste0(10:14, ':00-', 11:15, ':00'), 3),
  agendaitem = rep(paste0('Agenda item ', seq(5)), 3),
  stringsAsFactors = FALSE
)

## server function for Agenda Module
module_agenda <- function(input, output, session) {
  
  output$uiAgenda <- renderUI({
    l.agenda <- split.data.frame(df.agenda, df.agenda$day)
    l.agenda_day <- lapply(seq_along(l.agenda), function(i) {
      f7AccordionItem(
        title = names(l.agenda)[i],
        tagList(
          apply(l.agenda[[i]], 1, function(y) {
            f7Row(h4(y['day'], style = 'color: #b71c1c'), h4(y['time'], style = 'color: #0D47A1'), h4('agendaitem'), br(), h4('AUTHOR NAME'), hr())
          })
        )
      )
    })

    f7Card(title = 'Agenda',
           f7Shadow(
             intensity = 10,
             hover = TRUE,
             f7Accordion(
               mode = 'list',
               l.agenda_day
               )
             )
    )
  })
  
}
