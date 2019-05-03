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



## function to select a specific tab
tab_select <- function(session, tab = NULL) {
  if (!is.null(tab)) session$sendCustomMessage("tab-select", tab)
}


## input list: a list of inputs
## can currently render text, password, textarea and select
f7InputList <- function(inputList = list(), outline = FALSE, labels = 'stacked') {
  
  if (labels == 'inline') {
    label_class = 'item-title inline-label'
  } else if (labels == 'floating') {
    label_class = 'item-title item-floating-label'
  } else {
    label_class = 'item-title item-label'
  }
  
  li_class <- paste0("item-content item-input", ifelse(outline == TRUE, " item-input-outline", ""))
  
  div(class = "list",
      tags$ul(
        lapply(inputList, function(x) {
          
          if (x$type == "text") {
            input_details <- tags$input(type = "text", id = x$inputId, x$value)
          } else if (x$type == "password") {
            input_details <- tags$input(type = "password", id = x$inputId)
          } else if (x$type == "textarea") {
            input_details <- tags$textarea(id = x$inputId, x$value)
          } else if (x$type == 'select') {
            input_details <- tagList(
              tags$select(id = x$inputId,
                          tagList(lapply(x$choices, function(x) tags$option(value=x, x)))
              )
            )
          }
          
          if (.getTrue(x$clearButton, TRUE)) {
            input_details <- tagList(input_details, tags$span(class = "input-clear-button"))
          }
          
          tags$li(class = li_class,
                  div(class = "item-inner",
                      div(class = label_class, x$label),
                      div(class = "item-input-wrap form-group shiny-input-container",
                          input_details
                      )
                  ))
        })
      )
  )
}


## return true if x == validate and not null
.getTrue <- function(x, validate) {
  if (!is.null(x)) {
    if (x == validate) {
      return(TRUE)
    } else {
      return(FALSE)
    }
  } else {
    return(FALSE)
  }
}





