library(shiny)
library(ggplot2)
library(Quandl)

shinyServer(function(input, output) {

    # reread oil prices only when related parameters change, 
    # not when any parameter changes
    oil <- reactive({
        Quandl("DOE/RBRTE", 
               trim_start=input$start, 
               trim_end=input$end, 
               type="raw", 
               collapse=input$collapse, 
               order = "asc")
    })
    
    output$thePlot <- renderPlot({
        qplot(data = oil(), x = Date, y = Value) + 
            geom_line(color = input$color, 
                      size = 1) +
            labs(title = "Oil prices", 
                 x = "Date", 
                 y = "Value ($/barrel)")
    })
    output$color <- renderText({
        paste("Selected lines color code:", input$color)
    })
    output$color <- renderText({
        paste("Dot period:", input$collapse)
    })
    output$start <- renderText({
        paste("Selected start date:", input$start)
    })
    output$end <- renderText({
        paste("Selected end date:", input$end)
    })
})