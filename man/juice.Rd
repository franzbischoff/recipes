% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recipe.R
\name{juice}
\alias{juice}
\title{Extract transformed training set}
\usage{
juice(object, ..., composition = "tibble")
}
\arguments{
\item{object}{A \code{recipe} object that has been prepared with the option
\code{retain = TRUE}.}

\item{...}{One or more selector functions to choose which variables will be
returned by the function. See \code{\link[=selections]{selections()}} for more details. If no
selectors are given, the default is to use \code{\link[dplyr:reexports]{dplyr::everything()}}.}

\item{composition}{Either \code{"tibble"}, \code{"matrix"}, \code{"data.frame"}, or
\verb{"dgCMatrix"``for the format of the processed data set. Also, note that this argument should be called **after** any selectors and the selectors should only resolve to numeric columns if }composition\verb{is set to}"matrix"\code{or}"dgCMatrix"\verb{. If the data contains sparse columns they will be perseved for }"tibble"\code{and}"data.frame"\verb{, and efficiently used for }"dgCMatrix"`.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#superseded}{\figure{lifecycle-superseded.svg}{options: alt='[Superseded]'}}}{\strong{[Superseded]}}

As of \code{recipes} version 0.1.14, \strong{\code{juice()} is superseded} in favor of
\code{bake(object, new_data = NULL)}.

As steps are estimated by \code{prep}, these operations are applied to the
training set. Rather than running \code{\link[=bake]{bake()}} to duplicate this processing, this
function will return variables from the processed training set.
}
\details{
\code{juice()} will return the results of a recipe where \emph{all steps} have been
applied to the data, irrespective of the value of the step's \code{skip} argument.

\code{juice()} can only be used if a recipe was prepped with \code{retain = TRUE}. This
is equivalent to \code{bake(object, new_data = NULL)} which is the preferred way
to extract the transformation of the training data set.
}
\seealso{
\code{\link[=recipe]{recipe()}} \code{\link[=prep]{prep()}} \code{\link[=bake]{bake()}}
}
