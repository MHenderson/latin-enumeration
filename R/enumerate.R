library(dplyr)
library(minionator)

discrete_matrix <- function(nrow, ncol, domain, name = "l") {
  tidyr::expand_grid(row = 0:(nrow - 1), col = 0:(ncol - 1)) |>
    dplyr::mutate(
      lower = min(domain),
      upper = max(domain),
      name  = name,
      type  = "DISCRETE"
    )
}

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
