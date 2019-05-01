## Schedule Module

## UI for Schedule Module
module_scheduleUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiSchedule'))
}

## create a dummy schedule
df.schedule <- data.frame(
  day = rep(paste0('2019-08-', 21:23), each=5),
  time = rep(paste0(10:14, ':00-', 11:15, ':00'), 3),
  scheduleitem = rep(paste0('schedule item ', seq(5)), 3),
  stringsAsFactors = FALSE
)

## server function for Schedule Module
module_schedule <- function(input, output, session) {
  
  output$uiSchedule <- renderUI({
    l.schedule <- split.data.frame(df.schedule, df.schedule$day)
    l.schedule_day <- lapply(seq_along(l.schedule), function(i) {
      f7AccordionItem(
        title = names(l.schedule)[i],
        tagList(
          apply(l.schedule[[i]], 1, function(y) {
            f7Row(h4(y['day'], style = 'color: #b71c1c'), h4(y['time'], style = 'color: #0D47A1'), h4('scheduleitem'), br(), h4('AUTHOR NAME'), hr())
          })
        )
      )
    })

    f7Card(title = 'Schedule',
           f7Shadow(
             intensity = 10,
             hover = TRUE,
             f7Accordion(
               mode = 'list',
               l.schedule_day
               )
             )
    )
  })
  
}
