library(gtsummary)

here::i_am(
  "code/updated_descriptive_table.R"
)


cleaned_descriptive <- readRDS(
  file = here::here("output/cleaned_batting_no_pitchers.rds")
)

remove_name_and_positions <- cleaned_descriptive |>
  select(-name, -position)
  
table_statistics <- remove_name_and_positions |>
tbl_summary(
    by = year,
    statistic = list(all_categorical() ~ "{n}    ({p}%)",
                     all_continuous()  ~ "{median} ({p25}, {p75})"),
    digits = list(all_continuous()  ~ c(2, 2),
                  all_categorical() ~ c(0, 1)),
    type = list(batting_average  ~ "continuous",
                stolen_bases ~ "continuous",
                home_runs   ~ "continuous",
                games ~ "continuous",
                dominant_hand ~ "categorical"),
    label  = list(batting_average  ~ "Batting Average",
                  home_runs ~ "Home Runs",
                  stolen_bases ~ "Stolen Bases",
                  games  ~ "Games Played",
                  dominant_hand ~ "Dominant Hand")
)

batting_table_stat <- table_statistics |>
  modify_header(
    label = "**Variable**",
    all_stat_cols() ~ "**{level}**<br>N = {n} ({style_percent(p, digits=1)}%)"
  ) |>
  modify_caption("Atlanta Player Batting Statistics for 1995 and 2021") %>%
  bold_labels()  |>
  add_overall(
    last = FALSE,
    col_label = "**1995 and 2021**<br>N = {N}"
  )

batting_table_stat


saveRDS(
  batting_table_stat,
  file = here::here("output/descriptive_table.rds")
)

 



