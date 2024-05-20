library(dplyr)
library(minionator)

# this is already broken
l <- discrete_matrix(3, 3, 0:2)

row_latin <- tribble(
  ~constraint,             ~variables,
  "alldiff", l |> filter(row == 0),
  "alldiff", l |> filter(row == 1),
  "alldiff", l |> filter(row == 2)
)