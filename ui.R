library(shiny)
library(ggplot2)
library(DT)
library(readr)
library(plotly)
library(ggthemes)

MenPSA <- read_csv("/home/lmwhip17/R/Stat450/PSA/MenPSA.csv")
WomenPSA <- read_csv("/home/lmwhip17/R/Stat450/PSA/WomenPSA.csv")


shinyUI(fluidPage(
   
    titlePanel("PSA Rankings Data"),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Men's",
                     h2("Men's Rankings"),
                     DT::dataTableOutput("Rankings1"),
                     h2("Graph of Men's Rankings"),
                     plotOutput("menrank",
                                click = "menrank_click",
                                brush = brushOpts(
                                    id = "menrank_brush"
                                ))),
            fluidRow(
                column(width = 6,
                       h4("Points Near Click"),
                       verbatimTextOutput("click_info")),
                column(width = 6,
                       h4("Brushed Points"),
                       verbatimTextOutput("brush_info"))
            ),
            
            tabPanel("Women's",
                     h2("Women's Rankings"),
                     DT::dataTableOutput("Rankings2"),
                     h2("Graph of Women's Rankings"),
                     plotOutput("womenrank",
                                click = "womenrank_click",
                                brush = brushOpts(
                                    id = "womenrank_brush"
                                ))),
            fluidRow(
                column(width = 6,
                       h4("Points Near Click"),
                       verbatimTextOutput("wclick_info")),
                column(width = 6,
                       h4("Brushed Points"),
                       verbatimTextOutput("wbrush_info"))
            ),
            
            tabPanel("Country",
                     column(3, 
                            selectInput(
                                inputId =  "date_from", 
                                label = "Select Year:", 
                                choices = 2014:2021
                            )),
                     h2("Men's Countries"),
                     plotlyOutput("hist"),
                     h2("Women's Countries"),
                     column(3, 
                            selectInput(
                                inputId =  "date_from", 
                                label = "Select Year:", 
                                choices = 2014:2021
                            )),
                     plotlyOutput("hist2")),
            
            tabPanel("Racket",
                     column(3, 
                            selectInput(
                                inputId =  "date_from", 
                                label = "Select Year:", 
                                choices = 2014:2021
                            )),
                     h2("Men's Rackets"),
                     plotlyOutput("rack_hist"),
                     h2("Women's Rackets"),
                     column(3, 
                            selectInput(
                                inputId =  "date_from", 
                                label = "Select Year:", 
                                choices = 2014:2021
                            )),
                     plotlyOutput("rack_hist2"))
                          
                     ))
    ))