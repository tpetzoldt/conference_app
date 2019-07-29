library(rsconnect)

# Print a list of app dependencies. Libraries need to be loaded
# before publishing so deployApp() knows what is necessary.
library(shiny)
library(shinyF7)
library(tidyverse)

# Set the account info for deployment.
setAccountInfo(name   = "epijimapps",
               token  = Sys.getenv("shinyapps_token"),
               secret = Sys.getenv("shinyapps_secret"))


# app_files 
  get_files_dir <- function(path) paste0(path,list.files(path))

  files <- c(
    "app.R",
    "data/df_schedule.csv",
    "data/df_users.csv",
    "shinyF7_extend.R",
    get_files_dir("modules/")
  )

# Deploy the application.
deployApp(
  forceUpdate = TRUE,
  appFiles = files
)
