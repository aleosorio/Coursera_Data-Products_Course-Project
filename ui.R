# Loading Libraries + Data
library(shiny)
library(tidyverse)
library(datasets)
data('iris')

# User Interface
shinyUI(fluidPage(

        titlePanel("Comparison Between 3 Flower Species' Attributes"),
        
        # Sidebar with inputs
        sidebarLayout(
                sidebarPanel(
                        
                        #  Drop down menu with possible attributes to compare
                        selectInput("attrib",
                                    "Attribute to compare:",
                                    choices = distinct(gather(iris, key = attribute, value = value, -Species), attribute)),
                        hr(),
                        helpText("Choose which attribute (Sepal Length, Sepal Width, Petal Length or Petal Width) to compare, through boxplots, between the following flower species: Setosa, Versicolor and Virginica")
                ),
                
        # Plot containing generated boxplots, from server.R
                mainPanel(
                        plotOutput("flowerPlot")
                )
        )
))
