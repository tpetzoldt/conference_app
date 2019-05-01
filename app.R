## mobile first conference management app
## written using shinyF7 (framework 7)

library(shiny)
library(shinyF7)

source('./shinyF7_extend.R')

source('./modules/module_home.R')
source('./modules/module_feed.R')
source('./modules/module_profile.R')
source('./modules/module_agenda.R')
source('./modules/module_attendees.R')
source('./modules/module_location.R')

server <- function(input, output, session) {

  ## Home Module
  callModule(module_home, 'home')
  output$homeUI <- renderUI({
    module_homeUI('home')
  })

  ## Feed Module
  callModule(module_feed, 'feed')
  output$feedUI <- renderUI({
    module_feedUI('feed')
  })
  
  ## Profile Module
  callModule(module_profile, 'profile')
  output$profileUI <- renderUI({
    module_profileUI('profile')
  })

  ## Agenda Module
  callModule(module_agenda, 'agenda')
  output$agendaUI <- renderUI({
    module_agendaUI('agenda')
  })
  
  ## Attendees Module
  callModule(module_attendees, 'attendees')
  output$attendeesUI <- renderUI({
    module_attendeesUI('attendees')
  })
  
  ## Location Module
  callModule(module_location, 'location')
  output$locationUI <- renderUI({
    module_locationUI('location')
  })

}

ui <- f7Page(
  
  tags$head(
    # javascript to select a tab
    # to be moved to shinyF7
    tags$script("
      Shiny.addCustomMessageHandler('tab-select', function(tab) {
        app.tab.show('#' + tab);
      });
    ")
  ),
  
  title = 'Conference App',
  f7Init(theme = 'md'),
  f7TabLayout(
    f7Panel(title = "About", side = "left", theme = "light", style = "cover",
            f7Row(
              div(class = 'col',
                  h4('this app was built using shinyf7'))
            )
    ),
    f7Navbar(title = 'Conference App', hairline = TRUE, shadow = TRUE, left_panel = TRUE, right_panel = FALSE),
    f7Tabs2(animated = TRUE, scrollable = TRUE,
           f7Tab(tabName = 'Home', icon = 'home', active = FALSE,
                 uiOutput('homeUI')
                 ),
           f7Tab(tabName = 'Feed', icon = 'list', active = FALSE,
                 uiOutput('feedUI')
                 ),
           f7Tab(tabName = 'Profile', icon = 'person', active = FALSE,
                 uiOutput('profileUI')
                 ),
           f7Tab(tabName = 'Agenda', icon = 'event_available', active = FALSE,
                 uiOutput('agendaUI')
                 ),
           f7Tab(tabName = 'Attendees', icon = 'people', active = FALSE,
                 uiOutput('attendeesUI')
                 ),
           f7Tab(tabName = 'Location', icon = 'place', active = FALSE,
                 uiOutput('locationUI')
                 )
           )
    )
)

shinyApp(ui, server)
