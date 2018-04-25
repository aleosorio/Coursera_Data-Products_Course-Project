library(shiny)
library(tidyverse)
library(datasets)

shinyUI(fluidPage(
        
        titlePanel("Comparison Between 3 Flower Species' Attributes"),
        
        # Sidebar with inputs
        sidebarLayout(
                sidebarPanel(
                        
                        #  Input for number of bins
                        sliderInput("bins",
                                    "Number of bins:",
                                    min = 1,
                                    max = 50,
                                    value = 30)
                ),
                
        # Plot containing generated histograms
                mainPanel(
                        plotOutput("distPlot")
                )
        )
))
