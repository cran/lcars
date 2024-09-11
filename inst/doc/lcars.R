## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", out.width = "100%", message = FALSE, warning = FALSE, error = FALSE
)

## ----ex-1---------------------------------------------------------------------
library(lcars)
library(trekcolors)
library(ggplot2)
library(grid)
library(png)

logo <- rasterGrob(readPNG(system.file("stlogo-white.png", package = "lcars")))
clrs <- c("#FF3030", "#FFFF33", "#20B2AA")

g <- ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() + 
  theme_lcars_dark() + 
  coord_cartesian(clip = "off") +
  annotation_custom(logo, xmin = 9.4, xmax = Inf, ymin = 3.6, ymax = Inf) +
  scale_color_manual(values = clrs)

len_frac <- c(0.55, 0.25, 0.2, 0.4, 0.1, 0.2, 0.1, 0.1)
n_seg <- c(1, 2, 0, 8)
corner_colors <- c("chestnut-rose", "lilac", rep("pale-canary", 2))
side_colors <- list("pale-canary", c("anakiwa", "lilac"), NA,
                    c("#000000", rep("anakiwa", 2), rep("orange-peel", 5)))
side_labels <- list(
  "R 47.0.2", c("47", "B4"), NA, 
  c("LCARS", "47174-A", "...", "O'Brien", "Lefler", "La Forge", "Barclay", "Argyle"))

lcars_border(g, corners = 1:3, length_frac = len_frac, side_n_segments = n_seg, 
             corner_color = corner_colors, side_color = side_colors, 
             side_label = side_labels, label_size = 0.7)

text(2.8, 0.1, "Iris dataset (classic Terran flora sample)", 
     col = lcars_colors("anakiwa"), font = 2, cex = 0.7)
text(7.55, 0.1, "LCARS BETA R Interface v0.0.1", 
     col = lcars_colors("pale-canary"), font = 2, cex = 0.7)

## ----ex1, eval=FALSE----------------------------------------------------------
#  if (interactive()) {
#  
#    ui <- lcarsPage(
#      lcarsBox(
#        fluidRow(
#          column(3,
#            h4("Main panel area"),
#            HTML("<p>Some paragraph text and <a href='#'>a link</a>
#            with LCARS styling.</p>
#            <p>Use <code>lcarsPage</code>
#            to apply the LCARS theme and <code>lcarsBox</code>
#            to draw a characteristic box for framing content.</p>
#            <p>Many of the <code>lcarsBox</code>
#            properties are configurable.
#            See <code>lcars::lcarsApp(\"box\")</code> for a demo</p>")
#          ),
#          column(9, plotOutput("plot1"))
#        ),
#        title = "box title",
#        left_inputs = buttonColumn(lcarsButton("btn1", "A button"))
#      )
#    )
#  
#    server <- function(input, output) {
#      output$plot1 <- renderPlot({
#        hist(rnorm(500))
#      })
#    }
#  
#    shinyApp(ui, server)
#  }

## ----apps, eval=FALSE---------------------------------------------------------
#  lcarsApp("demo")
#  lcarsApp("box")
#  lcarsApp("sweep")
#  lcarsApp("toggle")
#  lcarsApp("elements")
#  lcarsApp("leaflet")

## ----img1, echo=FALSE---------------------------------------------------------
knitr::include_graphics("lcarsBox-ex1.png")

## ----img2, echo=FALSE---------------------------------------------------------
knitr::include_graphics("lcarsBox-ex2.png")

## ----lcars-colors-------------------------------------------------------------
head(lcarsdata)

library(ggplot2)
library(trekcolors)

lcars_colors()

lcars_colors("melrose")

view_trek_pals(c("lcars_2357", "lcars_2369", "lcars_2375", "lcars_2379"))

ggplot(diamonds, aes(carat, stat(count), fill = cut)) +
  geom_density(position = "fill") + scale_fill_lcars("2357")

