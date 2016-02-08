library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    # regenerate the distribution only when its parameters change, 
    # not when any parameter of the histogram changes
    x <- reactive({
        rnorm(1000, mean = input$mean, input$sd)
    })
    
    output$thePlot <- renderPlot({
        ggplot(data = NULL, aes(x())) + 
        geom_histogram(binwidth = (max(x())-min(x()))/input$bins, 
                       col = input$color, 
                       aes(y = ..density.., 
                           fill=..count..)) + 
        geom_vline(aes(xintercept = input$mean), 
                   color = input$color, 
                   size = 1) +
        geom_density(size = 1, 
                     color = input$color) +
        labs(title = "Normal random distribution", 
             x = "Values", 
             y = "Density")
    })
    output$color <- renderText({
        paste("Selected lines color code:", input$color)
    })
    output$dist <- renderText({
        sprintf("Normal distribution parameters: mean = %d, sd = %d", 
                input$mean, 
                input$sd)
    })
})