## Schedule Module

## UI for Schedule Module
module_scheduleUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiSchedule'))
}

## server function for Schedule Module
module_schedule <- function(input, output, session) {
  
  output$uiSchedule <- renderUI({
    l.schedule <- split.data.frame(df_schedule, df_schedule$Date)
    l.schedule_day <- lapply(seq_along(l.schedule), function(i) {
      f7AccordionItem(
        title = names(l.schedule)[i],
        tagList(
          apply(l.schedule[[i]], 1, function(y) {
            f7Row(em(y['Time'], style = 'color: #0D47A1'), 
                  HTML('&nbsp;'),HTML('&nbsp;'),
                  em(y['ScheduleTitle']), 
                  br(), 
                  p(y['Abstract']), 
                  hr()
                  )
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
