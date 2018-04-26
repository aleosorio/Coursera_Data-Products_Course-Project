library(shiny)

shinyServer(function(input, output) {
        
        # Preparing Dataset
        dataset <- gather(iris, key = attribute, value = value, -Species)

        # Filters data to plot, based on input obtained from drop
        # down menu, from ui.R
        finaldata <- reactive({
                filter(dataset, attribute == input$attrib)
        })
        
        # Generate plot based on reactive data and input$attrib from ui.R
        output$flowerPlot <- renderPlot({
                
                ggplot(finaldata(), aes(Species, value)) +
                        geom_boxplot(aes(color = Species), alpha = 0.5) +
                        labs(title = input$attrib)
                
        })
  
})
