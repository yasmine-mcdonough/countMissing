
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countMissing

<!-- badges: start -->
<!-- badges: end -->

The goal of countMissing is to count missing values for all columns by
group.

Given a data frame `data` and a column `group`,
`count_all_missing_by_group()` creates a new data frame with one row per
level of `group`. The first column of the output data frame contains the
levels of `group`, and the rest of the columns contain the number of
missing values for all columns in `data` except `group`.

## Installation

You can install the development version of countMissing from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("yasmine-mcdonough/countMissing")
```

## Example

This example computes the number of missing values in the `airquality`
dataset grouped by the `cyl` column.

``` r
library(countMissing)
count_all_missing_by_group(airquality, Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```
