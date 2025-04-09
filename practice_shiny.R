#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(bslib)
library(lubridate)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Iris Flowers"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           plotOutput("densityplot"),
           plotOutput("barplot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
     
      ggplot(iris, aes(x = Sepal.Length)) +
        geom_histogram(bins = input$bins, fill = "steelblue", color = "white") +
        labs(title = "Histogram of Sepal Length", x = "Sepal Length", y = "Count")
      
    
})

output$densityplot <- renderPlot({
  ggplot(iris, aes(x=Species)) +
    geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8) +
    labs(title = "Density graph of Species")
})


output$barplot <- renderPlot({
  ggplot(iris, aes(x=Petal.Width, y=Petal.Length)) + 
    geom_bar(stat = "identity") +
    labs(title = "Barplot of the petal width and length")
  
})

}

# Run the application 
shinyApp(ui = ui, server = server)
