## mobile first conference management app
## written using shinyF7 (framework 7)

library(shiny)
library(shinyF7)

## new version of f7Tabs allows setting scrollable
f7Tabs2 <- function(..., swipeable = FALSE, animated = TRUE, scrollable = FALSE) {
  
  if (swipeable && animated) stop("Cannot use two effects at the same time")
  
  toolbarItems <- list(...)
  len <- length(toolbarItems)
  found_active <- FALSE
  
  # toolbar items
  toolbarTag <- f7Toolbar(
    position = "bottom",
    hairline = TRUE,
    shadow = TRUE,
    icons = TRUE,
    scrollable = scrollable,
    lapply(1:len, FUN = function(i) {
      
      item <- toolbarItems[[i]][[1]]
      itemIcon <- toolbarItems[[i]][[2]]
      itemName <- toolbarItems[[i]][[3]]
      itemClass <- item$attribs$class
      itemId <- item$attribs$id
      
      # make sure that if the user set 2 tabs active at the same time,
      # only the first one is selected
      if (!found_active) {
        active <- sum(grep(x = itemClass, pattern = "active")) == 1
        if (active) found_active <<- TRUE
        # if there is already an active panel, set all other to inactive
      } else {
        active <- FALSE
      }
      
      # generate the link
      if (!is.null(itemIcon)) {
        shiny::a(
          href = paste0("#", itemId),
          class = if (active) "tab-link tab-link-active" else "tab-link",
          shiny::tags$i(class = "icon f7-icons ios-only", itemIcon),
          shiny::tags$i(class = "icon material-icons md-only", itemIcon),
          shiny::span(class = "tabbar-label", itemName)
        )
      } else {
        shiny::a(
          href = paste0("#", itemId),
          class = if (active) "tab-link tab-link-active" else "tab-link",
          itemName
        )
      }
    })
  )
  
  # related page content
  contentTag <- shiny::tags$div(
    class = "tabs ios-edges",
    lapply(1:len, function(i) { toolbarItems[[i]][[1]]})
  )
  
  # handle swipeable tabs
  if (swipeable) {
    contentTag <- shiny::tags$div(
      class = "tabs-swipeable-wrap",
      contentTag
    )
  }
  
  if (animated) {
    contentTag <- shiny::tags$div(
      class = "tabs-animated-wrap",
      contentTag
    )
  }
  
  shiny::tagList(toolbarTag, contentTag)
  
}


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
    f7Tabs2(animated = TRUE, scrollable = TRUE,
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
           f7Tab(tabName = 'Attendees', icon = 'people', active = FALSE,
                 f7Card(
                   h4('attendees')
                 )),
           f7Tab(tabName = 'Attendees', icon = 'people', active = FALSE,
                 f7Card(
                   h4('attendees')
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
