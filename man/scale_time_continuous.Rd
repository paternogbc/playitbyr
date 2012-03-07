\name{scale_time_continuous}
\alias{scale_time_continuous}
\alias{scale_time_exp}
\title{Continuous time scales}
\usage{
  scale_time_continuous(min, max, dmin = NULL, dmax = NULL,
    ...)

  scale_time_exp(min, max, dmin = NULL, dmax = NULL, ...)
}
\arguments{
  \item{min}{The desired minimum value, a \code{numeric} of
  length 1}

  \item{max}{The desired maximum value, a \code{numeric} of
  length 1}

  \item{dmin}{The data value to be lined up with the
  \code{min} argument. This is useful for when you want to
  specify a fixed scale}

  \item{dmax}{The data value to be lined up with the
  \code{max} argument. This is useful for when you want to
  specify a fixed scale}

  \item{\dots}{Other parameters (currently ignored)}
}
\value{
  A \code{sonscaling} object, to be used in \code{sonify}
  or added onto a \code{sonify} object.
}
\description{
  These shortcut functions (with the notation
  \code{scale_}\kbd{[sound parameter]}\code{_}\kbd{[scaling
  function]}) are intended to be added onto a \code{sonify}
  object to specify how \kbd{[data parameter]} from the
  data (a column of the data) is to be mapped to sonic
  parameters.
}
\details{
  \code{_continuous} scales are a linear scaling, whereas
  \code{_exp} is an exponential scale.
}
\seealso{
  \code{\link{sonscaling}} for the full syntax and range of
  possibilities for specifying scaling of \code{sonify}
  objects; \code{\link{linear_scale}}
  \code{\link{exp_scale}} for the pre-defined scaling
  functions which this incorporates; \code{\link{+.sonify}}
  for the addition onto \code{sonify} objects.
}
