\name{shape_histogram}
\alias{shape_histogram}
\title{Create a histogram layer}
\usage{
  shape_histogram(length = 5, tempo = 240, ...,
    data = NULL, mapping = NULL)
}
\arguments{
  \item{length}{The overall length, in seconds, of the
  histogram.}

  \item{tempo}{The tempo, in beats per minute; i.e. the
  rapidity with which to represent values from the
  dataset.}

  \item{\dots}{settings to pass to \code{\link{sonlayer}}
  (see Details)}

  \item{data}{The \code{data.frame} to be sonified for this
  layer. If blank, the data from the parent \code{sonify}
  object is used.}

  \item{mapping}{A \code{\link{sonaes}} object.}
}
\value{
  A \code{sonlayer} object that can be added onto a
  \code{\link{sonify}} object.
}
\description{
  Creates a histogram layer
}
\details{
  The audio histogram is implemented by a simple
  frequency-modulation synthesis (through csound),
  representing a univariate view of the data by rapidly
  playing pitches that are samples from the dataset. Only
  \code{pitch} is intended to be used for mapping.

  To compare groups, one can facet by the grouping variable
  (see \code{\link{sonfacet}}). All of the examples below
  use this technique.

  The remainder of the sound parameters (the same as those
  used by \code{\link{shape_scatter}}) are available for
  setting to tweak aesthetics for the analyst's ear:

  \describe{ \item{time}{The starting time of the note (in
  seconds).} \item{pitch}{The pitch of the note, in the
  Csound
  \href{"http://www.csounds.com/manual/html/cpsoct.html"}{oct
  notation} notation for pitches, where 8 is middle C and 1
  represents an octave, to the corresponding frequency in
  Hertz.  By default this is scaled to the nearest musical
  (chromatic) pitch. (See
  \code{\link{scale_pitch_continuous}}.)} \item{dur}{The
  duration of the note (relative to the total time if
  \code{relative = TRUE}, in seconds otherwise).}
  \item{amp}{The volume of the note, as a proportion
  between 0 and 1, where 1 is the maximum volume. Note that
  a multiple notes that happen at the same time could add
  up to more than one, causing distortion and clipping.}
  \item{attkp}{The proportion of the note's length devoted
  to the initial (linear) attack.} \item{decayp}{The
  proportion of the note's length devoted to the (linear)
  decay.} \item{indx}{The index of modulation. This affects
  the distortion of the tone; \code{indx = 0} is a sine
  wave, whereas higher indices of modulation give
  increasingly complex tones.} \item{mod}{The modulating
  frequency, given as a multiple of the primary frequency
  (i.e. given by \code{pitch}).} }

  To \emph{set} a sound parameter to a value, you simply
  include it as an extra argument in \code{shape_scatter};
  to \emph{map} a parameter, you set the mapping for the
  layer or the \code{sonify} object using
  \code{\link{sonaes}} (see examples in
  \code{\link{shape_scatter}}).
}
\examples{
x1 <- sonify(iris, sonaes(pitch = Sepal.Length)) + sonfacet(Species) +
   shape_histogram(length = 3, tempo = 1800)
\dontrun{x1}
x2 <- sonify(iris, sonaes(pitch = Sepal.Length)) + sonfacet(Species) +
  shape_histogram(length = 5, tempo = 1800) # plays the same thing for longer
\dontrun{x2}
x3 <- sonify(iris, sonaes(pitch = Sepal.Length)) + sonfacet(Species) +
  shape_histogram(length = 3, tempo = 1200) #  same length as original but fewer pitches
\dontrun{x3}
}
\references{
  S. Ferguson, W. Martens and D. Cabrera, ``Statistical
  Sonification for Exploratory Data Analysis'', in
  \emph{The Sonification Handbook}, ed. Hermann, Hunt,
  Neuhoff. Available:
  \url{http://sonification.de/handbook/}
}

