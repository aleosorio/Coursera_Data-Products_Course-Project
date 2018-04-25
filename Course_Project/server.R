library(shiny)

shinyServer(function(input, output) {
        
        # Generate plot based on input$attrib from ui.R
        output$flowerPlot <- renderPlot({
                
                # Filters data to plot, based on input obtained from drop
                # down menu, from ui.R
                finaldata <- filter(dataset, attribute == input$attrib)
                
                # Final plot to show back in ui.R
                ggplot(finaldata, aes(Species, value)) +
                        geom_boxplot(aes(color = Species), alpha = 0.5) +
                        labs(title = input$attrib)
                
        })
  
})
