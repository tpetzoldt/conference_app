## mobile first conference management app
## written using shinyF7 (framework 7)

library(shiny)
#library(shinyF7)
library(shinyMobile)
library(tidyverse)

df_schedule <- read_csv('./data/df_schedule.csv')
df_users <- read_csv('./data/df_users.csv')


source('./shinyF7_extend.R')

source('./modules/module_home.R')
source('./modules/module_info.R')
source('./modules/module_schedule.R')
source('./modules/module_attendees.R')
source('./modules/module_location.R')
source('./modules/module_mixer.R')

server <- function(input, output, session) {

  ## Home Module
  callModule(module_home, 'home')
  output$homeUI <- renderUI({
    module_homeUI('home')
  })
  
  ## Info Module
  callModule(module_info, 'info')
  output$infoUI <- renderUI({
    module_infoUI('info')
  })
  
  ## Agenda Module
  callModule(module_schedule, 'schedule', df_schedule)
  output$scheduleUI <- renderUI({
    module_scheduleUI('schedule')
  })

  ## Attendees Module
  callModule(module_attendees, 'attendees', df_users)
  output$attendeesUI <- renderUI({
    module_attendeesUI('attendees')
  })
  
  ## Location Module
  callModule(module_location, 'location')
  output$locationUI <- renderUI({
    module_locationUI('location')
  })

  ## Mixer Module
  callModule(module_mixer, 'mixer')
  output$mixerUI <- renderUI({
    module_mixerUI('mixer')
  })
  
}

ui <- f7Page(
  
  tags$head(
    # javascript to select a tab
    # to be moved to shinyF7
    tags$script(HTML("
      Shiny.addCustomMessageHandler('tab-select', function(tab) {
        app.tab.show('#' + tab);
      });
    "))
  ),
  
  title = 'R/Pharma 2019',
  init = f7Page(theme = 'auto'),
  f7TabLayout(
    panels = f7Panel(title = "About", side = "left", theme = "light", style = "cover",
            f7Row(
              f7Button(color = "blue", label = "rinpharma.com", href = "http://rinpharma.com")
            ),
            f7Row(
              p('Built using shinyF7')
            )
    ),
    navbar = f7Navbar(title = 'R/Pharma conference app', hairline = TRUE, shadow = TRUE, left_panel = TRUE, right_panel = FALSE),
    f7Tabs2(animated = TRUE, scrollable = TRUE,
           f7Tab(tabName = 'Home', icon = f7Icon('home_fill'), active = FALSE,
                 uiOutput('homeUI')
                 ),
           f7Tab(tabName = 'Info', icon = f7Icon('info'), active = FALSE,
                 uiOutput('infoUI')
           ),
           f7Tab(tabName = 'Schedule', icon = f7Icon('calendar_fill'), active = FALSE,
                 uiOutput('scheduleUI')
                 ),
           f7Tab(tabName = 'Attendees', icon = f7Icon('persons'), active = FALSE,
                 uiOutput('attendeesUI')
                 ),
           f7Tab(tabName = 'Location', icon = f7Icon('placemark_fill'), active = FALSE,
                 uiOutput('locationUI')
                 ),
           f7Tab(tabName = 'Mixer', icon = f7Icon('chat_fill'), active = FALSE,
           uiOutput('mixerUI')
                 )
           )
    )
)

shinyApp(ui, server)
