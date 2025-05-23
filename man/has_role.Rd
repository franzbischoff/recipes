% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/selections.R
\name{has_role}
\alias{has_role}
\alias{has_type}
\alias{all_outcomes}
\alias{all_predictors}
\alias{all_date}
\alias{all_date_predictors}
\alias{all_datetime}
\alias{all_datetime_predictors}
\alias{all_double}
\alias{all_double_predictors}
\alias{all_factor}
\alias{all_factor_predictors}
\alias{all_integer}
\alias{all_integer_predictors}
\alias{all_logical}
\alias{all_logical_predictors}
\alias{all_nominal}
\alias{all_nominal_predictors}
\alias{all_numeric}
\alias{all_numeric_predictors}
\alias{all_ordered}
\alias{all_ordered_predictors}
\alias{all_string}
\alias{all_string_predictors}
\alias{all_unordered}
\alias{all_unordered_predictors}
\alias{current_info}
\title{Role Selection}
\usage{
has_role(match = "predictor")

has_type(match = "numeric")

all_outcomes()

all_predictors()

all_date()

all_date_predictors()

all_datetime()

all_datetime_predictors()

all_double()

all_double_predictors()

all_factor()

all_factor_predictors()

all_integer()

all_integer_predictors()

all_logical()

all_logical_predictors()

all_nominal()

all_nominal_predictors()

all_numeric()

all_numeric_predictors()

all_ordered()

all_ordered_predictors()

all_string()

all_string_predictors()

all_unordered()

all_unordered_predictors()

current_info()
}
\arguments{
\item{match}{A single character string for the query. Exact matching is used
(i.e. regular expressions won't work).}
}
\value{
Selector functions return an integer vector.

\code{current_info()} returns an environment with objects \code{vars} and \code{data}.
}
\description{
\code{has_role()}, \code{all_predictors()}, and \code{all_outcomes()} can be used to select
variables in a formula that have certain roles.

\strong{In most cases}, the right approach for users will be use to use the
predictor-specific selectors such as \code{all_numeric_predictors()} and
\code{all_nominal_predictors()}. In general you should be careful about using
\code{-all_outcomes()} if a \verb{*_predictors()} selector would do what you want.

Similarly, \code{has_type()}, \code{all_numeric()}, \code{all_integer()}, \code{all_double()},
\code{all_nominal()}, \code{all_ordered()}, \code{all_unordered()}, \code{all_factor()},
\code{all_string()}, \code{all_date()} and \code{all_datetime()} are used to select columns
based on their data type.

\code{all_factor()} captures ordered and unordered factors, \code{all_string()}
captures characters, \code{all_unordered()} captures unordered factors and
characters, \code{all_ordered()} captures ordered factors, \code{all_nominal()}
captures characters, unordered and ordered factors.

\code{all_integer()} captures integers, \code{all_double()} captures doubles,
\code{all_numeric()} captures all kinds of numeric.

\code{all_date()} captures \code{\link[=Date]{Date()}} variables, \code{all_datetime()} captures
\code{\link[=POSIXct]{POSIXct()}} variables.

See \link{selections} for more details.

\code{current_info()} is an internal function.

All of these functions have have limited utility outside of column selection
in step functions.
}
\examples{
\dontshow{if (rlang::is_installed("modeldata")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
data(biomass, package = "modeldata")

rec <- recipe(biomass) |>
  update_role(
    carbon, hydrogen, oxygen, nitrogen, sulfur,
    new_role = "predictor"
  ) |>
  update_role(HHV, new_role = "outcome") |>
  update_role(sample, new_role = "id variable") |>
  update_role(dataset, new_role = "splitting indicator")

recipe_info <- summary(rec)
recipe_info

# Centering on all predictors except carbon
rec |>
  step_center(all_predictors(), -carbon) |>
  prep(training = biomass) |>
  bake(new_data = NULL)
\dontshow{\}) # examplesIf}
}
