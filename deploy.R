library(rsconnect)

# Print a list of app dependencies. Libraries need to be loaded
# before publishing so deployApp() knows what is necessary.
library(shiny)
library(shinyF7)
library(pool)
library(tidyverse)

# Set the account info for deployment.
setAccountInfo(name   = "epijimapps",
               token  = Sys.getenv("shinyapps_token"),
               secret = Sys.getenv("shinyapps_secret"))

# app_files 
  files <- c(
    "app.R",
    "conference_app.sqlite",
    "shinyF7_extend.R",
    list.files("modules")
  )

# Deploy the application.
deployApp(
  forceUpdate = TRUE,
  appFiles = files
)
