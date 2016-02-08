library(shiny)
library(ggplot2)

shinyUI(fluidPage(
    
    titlePanel("Course project - shiny application"),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        label = h3("Number of bins:"),
                        min = 1,
                        max = 50,
                        value = 30),
            selectInput("color", 
                        label = h3("Lines color:"), 
                        choices = list("black" = 1, "red" = 2,
                                       "green" = 3, "blue" = 4), selected = 3),
            numericInput("mean", 
                         label = h3("Mean:"), 
                         value = 0),
            numericInput("sd", 
                         label = h3("Standard Diviation:"), 
                         value = 1)),
        mainPanel(
            h2("Diagram parameters:"),
            textOutput("color"),
            textOutput("dist"),
            plotOutput("thePlot")
        )
    )
))
