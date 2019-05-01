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
