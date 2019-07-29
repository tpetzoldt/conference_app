## create a sqlite database for demo purposes

if (basename(getwd()) != "data") stop("setwd() to 'data' pre running scripts")

library(DBI)
library(googlesheets)
library(tidyverse)

## get data

  # the schedule--------------------------
  # to create .httr-oauth in rds format
  # token <- gs_auth()
  # saveRDS(token, file = "googlesheets_token.rds")
  suppressMessages(gs_auth(token = "googlesheets_token.rds", verbose = FALSE))
  # extract_key_from_url(
  #   "https://docs.google.com/spreadsheets/d/1BVCW8XrR9DdGK_F0stTeWa7AFAlpXjims05VEmwgRjY/edit#gid=1383678347"
  # )
  workbook_key <- "1BVCW8XrR9DdGK_F0stTeWa7AFAlpXjims05VEmwgRjY"
  workbook <- gs_key(workbook_key)
  
  schedule <- workbook %>%
    gs_read(
      ws = "2019_Schedule Revised",
      range = cell_rows(2:100))
  
  schedule_data <- schedule %>%
    mutate(
      date = as.Date(date)
    ) %>%
    # if date missing - delete
    filter(
      !is.na(date)
    ) %>%
    mutate(
      Date = paste(date,"-", weekdays(date)),
      Time = paste0(start_time," - ",end_time),
      Type = type,
      Room = room,
      Title = case_when(
        !is.na(title) ~ title,
        TRUE ~ `talk/workshop_desc`
      ),
      Speaker = speaker
    )
  
  # Tidy
  schedule_data <- schedule_data %>%
    select(
      Date,
      Time,
      Room,
      Title,
      Speaker,
      Abstract = abstract
    )
  
  # the attendees--------------------------
  workbook_key <- "1UxsynZg8U-FG_Yf_LiUNRAebtJKsUQpOrehPIfPqqw0"
  workbook <- gs_key(workbook_key)
  attendees <- workbook %>%
    gs_read(ws = "App_Output") %>%
    filter(Attending) %>%
    # REMOVE EMAILS!
    select(-c(Email,Attending))
  
# save data --------------------------
  
  df_users <- attendees %>%
    select(
      Name,
      Affiliation = Company
    ) %>%
    mutate(
      Phonebook = paste0(Name," (",Affiliation,")")
    )

  df_schedule <- schedule_data %>%
    left_join(
      df_users,
      by = c("Speaker" = "Name")
    ) %>%
    mutate(
      # make it easier to write to paste
      Abstract = case_when(
        is.na(Abstract) ~ " ",
        TRUE ~ Abstract
      ),
      # add in a 'combined title and author
      ScheduleTitle = case_when(
        is.na(Speaker) | Room %in% c("TBD","TBC","Concourse") ~ Title,
        is.na(Affiliation)  ~ paste0(Title," (",Speaker,")"),
        TRUE ~ paste0(Title," (",Speaker," - ",Affiliation,")")
      )
    )

  write_csv(df_schedule,"df_schedule.csv")
  write_csv(df_users,"df_users.csv")
