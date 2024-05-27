library(dplyr)
library(minionator)

l <- discrete_matrix(3, 3, 0:2)

row_latin <- tribble(
  ~constraint,            ~variables,
    "alldiff", l |> filter(row == 0),
    "alldiff", l |> filter(row == 1),
    "alldiff", l |> filter(row == 2)
)

column_latin <- tribble(
  ~constraint,            ~variables,
    "alldiff", l |> filter(col == 0),
    "alldiff", l |> filter(col == 1),
    "alldiff", l |> filter(col == 2)
)

latin <- list(
          variables = l,
             search = "PRINT ALL",
  unary_constraints = bind_rows(row_latin, column_latin)
)

minion_output(latin)
