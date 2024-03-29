% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shiny-rect.R
\name{lcarsBracket}
\alias{lcarsBracket}
\title{LCARS bracket element}
\usage{
lcarsBracket(
  ...,
  color = "golden-tanoi",
  background_color = "#000000",
  hollow = TRUE,
  width = "100\%"
)
}
\arguments{
\item{...}{div contents.}

\item{color}{bracket color. Any hex color or a named LCARS color.}

\item{background_color}{background color. Any hex color or a named LCARS
color. Applies when \code{hollow = TRUE}.}

\item{hollow}{logical, use a hollow bracket. The cutout section has
\code{background_color}.}

\item{width}{a valid CSS unit.}
}
\value{
an HTML widget
}
\description{
A top and bottom bracket pair element used to visually group contents.
}
\examples{
## Only run examples in interactive R sessions
if (interactive()) {

  ui <- lcarsPage(
    fluidRow(
      column(4,
        h4("Hollow bracket"),
        lcarsBracket(
          lcarsRect("Some text.", text_size = 24, height = 40)
        ),
        h4("Solid bracket"),
        lcarsBracket(
          lcarsRect("Some text.", color = "#000000",
                    text_color = "golden-tanoi",
                    text_size = 24, height = 40),
          hollow = FALSE
        )
      )
    )
  )

  server <- function(input, output) {}

  shinyApp(ui, server)
}
}
