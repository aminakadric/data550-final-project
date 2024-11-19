library(dplyr)
library(janitor)

here::i_am(
  "code/data_clean.R"
)

library(readr)
ATL_batting <- read_csv("data/ATL_batting.csv")

braves_batting_1995_2021 <- ATL_batting |>
  clean_names(case = "snake") |>
  filter(year == 2021 | year == 1995) |>
  select("name", "year", "batting_average", "stolen_bases", 
         "home_runs", "games", "dominant_hand", "position")


batting_no_pitchers <- braves_batting_1995_2021 |>
  filter(position !="P")

saveRDS(
  batting_no_pitchers,
  file = here::here("output/cleaned_batting_no_pitchers.rds")
)

#data_clean <- data2 |>
  #group_by(year) |>
  #summarize(mean = mean(batting_average, na.rm = TRUE),
            #sd = sd(batting_average, na.rm = TRUE),
            #median = median(batting_average, na.rm=TRUE),
            #obs = n())



