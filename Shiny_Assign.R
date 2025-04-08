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
install.packages("rsconnect")
library(rsconnect)

rsconnect::deployApp('path/to/your/app')
df_5<-read.csv("https://raw.githubusercontent.com/nardos-tekle/Data-Science-Projects/refs/heads/main/TB_Burden_Country.csv")


# Define UI for application that draws a histogram
ui <- fluidPage(

  titlePanel("Tuberculosis over the years"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 0,
                  max = 1762,
                  value = 85)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distplot"),
      plotOutput("densityplot"),
      plotOutput("barplot")
    )
  ) 
  )


# Define server logic required to draw a histogram
server <- function(input, output) {

  output$distplot <- renderPlot({
        # generate bins based on input$bins from ui.R
    x    <- rnorm(50000,5,1)
    
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    ggplot(df_5, aes(x=Estimated.prevalence.of.TB..all.forms..per.100.000.population)) + 
      geom_histogram(bins =30)

  })
  
  output$densityplot <- renderPlot({
  ggplot(df_5, aes(x=Region)) +
    geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8)
  })
  
  
  output$barplot <- renderPlot({
  ggplot(df_5, aes(x=Year, y=Estimated.prevalence.of.TB..all.forms..per.100.000.population)) + 
    geom_bar(stat = "identity")

})
  

}
    
# Run the application 
shinyApp(ui, server)
