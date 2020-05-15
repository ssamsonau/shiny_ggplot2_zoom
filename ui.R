library(shiny)
library(tidyverse)
library(ggplot2)
library(shinycssloaders) ## spinner

ui <- shinyUI(fluidPage(
  
  titlePanel("Interactive ggplot2 in Shiny"),
  
  tags$hr(),
  verticalLayout(
    fluidRow(
      
      h3("How to interact with plots"),
      tags$ul("ZOOM IN: Select area (double-click and drag), double click inside area. Repeat as needed"),
      tags$ul("CLEAR SELECTION: one-click on plot outside of the selected area"),
      tags$ul("RESET ZOOM: double-click on plot outside of selected area"),
      tags$hr(),
      
      column(width = 5, 
             plotOutput("plot1",
                        brush = brushOpts(id = "plot1_brush", direction = "x", clip = FALSE, resetOnNew = TRUE), 
                        dblclick = "plot1_dblclick", click = "plot1_click") %>% withSpinner()),
      column(width = 5, 
             plotOutput("plot2",
                        brush = brushOpts(id = "plot2_brush", resetOnNew = TRUE), 
                        dblclick = "plot2_dblclick", click = "plot2_click") %>% withSpinner())
    )
  )
))

