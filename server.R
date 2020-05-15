library(tidyverse)

server <- function(input, output) {
  
  values <- reactiveValues()
  
  mpg <- ggplot2::mpg
  
  output$plot1 <- renderPlot({

    pl <- ggplot(mpg) +
      geom_histogram(aes(x = displ))
    
    brush = values$plot1_brush
    if(!is.null(brush)){
      pl <- pl +
        xlim(c(brush$xmin, brush$xmax))
    }

    pl
  })
  
  observeEvent(input$plot1_dblclick, values$plot1_brush <- input$plot1_brush)
  
  output$plot2 <- renderPlot({
    
    pl <- ggplot(mpg) +
      geom_point(aes(x = displ, y = hwy))
    
    brush = values$plot2_brush
    if(!is.null(brush)){
      pl <- pl +
        xlim(c(brush$xmin, brush$xmax)) +
        ylim(c(brush$ymin, brush$ymax))
    }
    
    pl
  })
  
  observeEvent(input$plot2_dblclick, values$plot2_brush <- input$plot2_brush)
  
  
}