library(dplyr)
library(ggplot2)
library(tidyverse)

here::i_am(
  "code/graph.R"
)

cleaned_descriptive_data <- readRDS(
  file = here::here("output/cleaned_batting_no_pitchers.rds")
)

data_groupby_year <- cleaned_descriptive_data

box_plot <- ggplot(data_groupby_year, aes(x= dominant_hand, y = batting_average)) +
  geom_boxplot() +
  facet_wrap(~year) +
  stat_summary(fun = mean, geom="point", shape=20, size=5, 
               color="red", fill="red") +
  scale_fill_brewer(palette="Set1") +
  labs(y = "Battining Average", x = "Dominant Hand (R/L)")

box_plot

ggsave(
  here::here("output/box_plot.png"),
  plot = box_plot,
  device = png
)

