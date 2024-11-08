test_that("Output matches direct call to dplyr", {
  small_tbl <- tibble::tribble(~group, ~var1, ~var2,
                       "A", 1, NA,
                       "A", 2, "x",
                       "B", NA, "y",
                       "C", 3, "z")
#Test that the output matches the expected tbl when the level 'group' is specified
  expect_equal( small_tbl |> dplyr::group_by(group) |>
                  dplyr::summarize(across(tidyselect::everything(), ~sum(is.na(.x))),
                            .groups = "drop"),
                count_all_missing_by_group(small_tbl, group)
  )
#Test that the output matches the expected tbl when the level 'group' is specified and .groups is set to NULL
  expect_equal( small_tbl |> dplyr::group_by(group) |>
                  dplyr::summarize(across(tidyselect::everything(), ~sum(is.na(.x))),
                            .groups = NULL),
                count_all_missing_by_group(small_tbl, group, NULL)
  )
})

test_that("Checking error handling for .groups input", {

  #Test that an error occurs if a typo occurs when specifying the grouping
  expect_error(
    count_all_missing_by_group(airquality, Month, "kep")
  )
  #Test that no error occurs if the specified column exists and the specified grouping variable is a valid option
  expect_no_error(
    count_all_missing_by_group(airquality, Month, NULL)
  )
})
