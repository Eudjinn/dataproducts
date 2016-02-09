library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Creating data products project: Oil prices"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("color", 
                        label = h5("Select the color of the graph:"), 
                        choices = list("black" = 1, "red" = 2,
                                       "green" = 3, "blue" = 4), 
                        selected = 3),
            selectInput("collapse",
                        label = h5("Select the time period of one dot of the graph:"),
                        choices = list("daily" = "daily", 
                                       "weekly" = "weekly", 
                                       "monthly" = "monthly", 
                                       "quarterly" = "quarterly", 
                                       "annual" = "annual"),
                        selected = "monthly"),
            dateInput("start", 
                      label = h5("Select the start date:"), 
                      format = "yyyy-mm-dd",
                      value = "2001-01-01",
                      startview = "year"),
            dateInput("end", 
                      label = h5("Select the end date:"), 
                      format = "yyyy-mm-dd",
                      value = "2016-02-01",
                      startview = "year"),
            h6("If start/end date or time period represented by one dot has changed, the data for the graph will be reread and the graph will be redrawn."),
            h6("If you change the color, the graph will be redrawn with selected color but the data will not be reread.")
            ),
            mainPanel(
                h4("Selected graph parameters:"),
                textOutput("color"),
                textOutput("start"),
                textOutput("end"),
                plotOutput("thePlot"))
        )
))