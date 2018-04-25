# Loading Libraries + Data
library(shiny)
library(tidyverse)
library(datasets)
data('iris')

# Preparing Dataset
dataset <- gather(iris, key = attribute, value = value, -Species)
dropdown <- distinct(dataset, attribute) # Dataset containing dropdown menu options

# User Interface
shinyUI(fluidPage(
        
        titlePanel("Comparison Between 3 Flower Species' Attributes"),
        
        # Sidebar with inputs
        sidebarLayout(
                sidebarPanel(
                        
                        #  Input: attribute to compare
                        selectInput("attrib",
                                    "Attribute to compare:",
                                    choices = dropdown),
                        hr(),
                        helpText("Choose which attribute to compare among flower species")
                ),
                
        # Plot containing generated histograms
                mainPanel(
                        plotOutput("flowerPlot")
                )
        )
))
