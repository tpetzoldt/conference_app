## create a sqlite database for demo purposes

library(DBI)

df_users <- data.frame(
  name = c('alice adams', 'bob barnes', 'charlie croker', 'daniel davies', 'edward edwards'),
  email = c('alice.adams@my_company.com', 'bob.barnes@my_company.com', 'charlie.croker@my_company.com', 'daniel.davies@another_company.com', 'edward.edwards@another_company.com'),
  affiliation = c(rep('my_company', 3), rep('another_company', 2)),
  bio = c('alice bio', 'bob bio', rep('', 3)),
  photo = rep('', 5),
  stringsAsFactors = FALSE
)

df_schedule <- data.frame(
  day = rep(paste0('2019-08-', 21:23), each=5),
  time = rep(paste0(10:14, ':00-', 11:15, ':00'), 3),
  scheduleitem = rep(paste0('schedule item ', seq(5)), 3),
  stringsAsFactors = FALSE
)

## open database
db <- dbConnect(RSQLite::SQLite(), "conference_app.sqlite")

## create tables
dbExecute(db, "
  CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name CHAR(75) NOT NULL,
    email CHAR(150) NOT NULL,
    affiliation CHAR(75),
    bio TEXT,
    photo CHAR(20));"
)

dbExecute(db, "
  CREATE TABLE schedule(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    day CHAR(10) NOT NULL,
    time CHAR(11) NOT NULL,
    item CHAR(100));"
)

## upload data
for (i in 1:nrow(df_users)) {
  values <- paste0("'", df_users[i, ], "'", collapse = ',')
  dbExecute(db, sprintf('INSERT INTO users (name,email,affiliation,bio,photo) VALUES (%s)', values))
}

for (i in 1:nrow(df_schedule)) {
  values <- paste0("'", df_schedule[i, ], "'", collapse = ',')
  dbExecute(db, sprintf('INSERT INTO schedule (day,time,item) VALUES (%s)', values))
}

dbDisconnect(db)
