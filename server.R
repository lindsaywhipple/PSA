library(shiny)
library(ggplot2)
library(DT)
library(readr)
library(plotly)
library(ggthemes)

MenPSA <- read_csv("/home/lmwhip17/R/Stat450/PSA/MenPSA.csv")
WomenPSA <- read_csv("/home/lmwhip17/R/Stat450/PSA/WomenPSA.csv")


shinyServer(function(input, output) {

    output$Rankings1= DT::renderDataTable({
    MenPSA
  })
    output$menrank <- renderPlot({
      ggplot(MenPSA, aes(x = Ranking, y = Points, color = Year)) + 
        geom_point() + 
        geom_text(
          label = MenPSA$Name,
          nudge_x = 0.25,
          nudge_y = 0.25,
          check_overlap = T
        ) +
        theme_fivethirtyeight()
    })
    output$click_info <- renderPrint({
      nearPoints(MenPSA, input$menrank_click, addDist = TRUE)
    })
    output$brush_info <- renderPrint({
      brushedPoints(MenPSA, input$menrank_brush)
    })
output$Rankings2= DT::renderDataTable({
    WomenPSA
     })
    output$womenrank <- renderPlot({
      ggplot(WomenPSA, aes(x = Ranking, y = Points, color = Year)) + 
        geom_point() + 
        geom_text(
          label = WomenPSA$Name,
          nudge_x = 0.25,
          nudge_y = 0.25,
          check_overlap = T
        ) +
        theme_fivethirtyeight()
    })
    output$wclick_info <- renderPrint({
      nearPoints(WomenPSA, input$womenrank_click, addDist = TRUE)
          }) 
    output$wbrush_info <- renderPrint({
      brushedPoints(WomenPSA, input$womenrank_brush)
          })
    
    output$hist <- renderPlotly({
      f = ggplot(MenPSA, aes(x = Country)) +
               geom_histogram(stat = "count") +
        theme_fivethirtyeight()
      ggplotly(f)
    })
      
    
    output$hist2 <- renderPlotly({
      h = ggplot(WomenPSA, aes(x = Country)) +
              geom_histogram(stat = "count") +
        theme_fivethirtyeight()
      ggplotly(h)
    })
    
    output$rack_hist <- renderPlotly({
      i = ggplot(MenPSA, aes(x = Racket)) +
        geom_histogram(stat = "count") +
        theme_fivethirtyeight()
      ggplotly(i)
    })
    
    output$rack_hist2 <- renderPlotly({
      v = ggplot(WomenPSA, aes(x = Racket)) +
        geom_histogram(stat = "count") +
        theme_fivethirtyeight()
      ggplotly(v)
    })
    
    
    })
      
 

