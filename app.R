## mobile first conference management app
## written using shinyF7 (framework 7)

library(shiny)
library(shinyF7)

server <- function(input, output, session) {
  
}

ui <- f7Page(
  title = 'Conference App',
  f7Init(theme = 'md'),
  f7TabLayout(
    f7Panel(title = "About", side = "left", theme = "light", style = "cover",
            f7Row(
              div(class = 'col',
                  h4('this app was built using shinyf7'))
            )
    ),
    f7Navbar(title = 'tabs', hairline = TRUE, shadow = TRUE, left_panel = TRUE, right_panel = FALSE),
    f7Tabs(animated = TRUE,
           f7Tab(tabName = 'Home', icon = 'home', active = FALSE,
                 f7Card(
                   h4('home')
                   )),
           f7Tab(tabName = 'Feed', icon = 'list', active = FALSE,
                 f7Card(
                   h4('feed')
                   )),
           f7Tab(tabName = 'Profile', icon = 'person', active = FALSE,
                 f7Card(
                   h4('profile')
                   )),
           f7Tab(tabName = 'Agenda', icon = 'event_available', active = FALSE,
                 f7Card(
                   h4('agenda')
                   )),
           f7Tab(tabName = 'Attendees', icon = 'people', active = FALSE,
                 f7Card(
                   h4('attendees')
                   )),
           f7Tab(tabName = 'Location', icon = 'place', active = FALSE,
                 f7Card(
                   h4('location')
                   ))
           )
    )
)

shinyApp(ui, server)
