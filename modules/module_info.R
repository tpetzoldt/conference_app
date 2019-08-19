## Info Module

## UI for Info Module
module_infoUI <- function(id) {
  ns <- NS(id)
  uiOutput(ns('uiInfo'))
}

## server function for Info Module
module_info <- function(input, output, session) {
  output$uiInfo <- renderUI({
    f7Card(title = 'Useful Information',
           tagList(
             tags$h4('Registration'),
             tags$p('Registration will run from 8:10am.'),
             tags$h4('Communication'),
             tags$p(HTML(paste0('The best way to contact the Organizing Committee or other R/Pharma attendees is via the ', f7Link(src = 'https://rinpharma.slack.com', label = 'slack channel', external = TRUE), '.  We will leave this channel open as a way to continue conversations after the conference.'))),
             tags$h4('Workshops'),
             tags$p('Workshops will run on Wednesday, August 21st.  Morning workshops will start at 8:40am and afternoon workshops at 1:30pm.'),
             tags$p('Breakfast will not be available on the workshop day but lunch will be provided along with two scheduled breaks.'),
             tags$p(HTML(paste0('If you are registered for a workshop please bring a charged laptop.  We will be running instances of ', f7Link(src = 'https://rstudio.cloud/', label = 'RStudio Cloud', external = TRUE), ' and RTT (RStudio Training Tool).'))),
             tags$h4('Main Conference'),
             tags$p('All talks will be held in the Tsai Auditorium.  The conference and room will be full so please be mindful of space.'),
             tags$p('Breakfast will be available during registration, lunch will be at 12:30pm and there will also be a morning and afternoon break.'),
             tags$p('In addition to the keynotes and speakers, we have informal coffee sessions with some of the presenters.  Rooms for these will be assigned on Thursday and Friday.'),
             tags$h4('Presention Notes'),
             tags$p('Our aim is to provide as many opportunities as possible for people to share their work therefore we have a very tight schedule and appreciate speakers staying on time.  If there is insufficient time for questions we have the break, lunch and mixer sessions to continue conversations as well as the slack channel.  R/Pharma is deliberately small with 150 attendees and we hope this encourages active conversation and networking opportunities during breaks.'),
             tags$p('If you are presenting please find an Organizing Committee Member in the break before your talk to upload your presentation or test your laptop connection.'),
             tags$h4('Name Badge Colors'),
             tags$p('Organizing Committee Members will be wearing a blue name badge, Program Committee Members will be wearing a black one.  If you are interested in becoming more involved in R/Pharma please reach out to us.'),
             tags$h4('Weather'),
             tags$p('The weather this week will be mostly hot, in the 80s and 90s, with some isolated thunderstorms.'),
             hr(),
             tags$h4('A huge thank you to Harvard IQSS and the Advisory Groups without whom this conference would not happen.')
           )
           )
  })
}
