

library(shiny)
library(DT)


shinyUI(fluidPage(
  
  
  titlePanel("Tablas en DT"),
  
  tabsetPanel(
    
    
    
    tabPanel('Tablas DT',
             h1('vista basica'),
             DT::dataTableOutput('tabla1'),
             h1('Filtros'),
             DT::dataTableOutput('tabla2')),
    
    tabPanel('Click en tablas',
             fluidRow(
               column(5, 
                      h2("single select row"),
                      DT::dataTableOutput('tabla3'),
                      verbatimTextOutput('output1')),
               
               
               column(5, offset = 1,
                      h2("multiple select row"),
                      DT::dataTableOutput('tabla4'),
                      verbatimTextOutput('output2'))
               ),
             
             fluidRow(
               column(5, 
                      h2("single select column"),
                      DT::dataTableOutput('tabla5'),
                      verbatimTextOutput('output3')),
               
               
               column(5, offset = 1,
                      h2("multiple select column"),
                      DT::dataTableOutput('tabla6'),
                      verbatimTextOutput('output4'))
             ),
             
             fluidRow(
               column(5, 
                      h2("single cell column"),
                      DT::dataTableOutput('tabla7'),
                      verbatimTextOutput('output5')),
               
               
               column(5, offset = 1,
                      h2("multiple cell column"),
                      DT::dataTableOutput('tabla8'),
                      verbatimTextOutput('output6'))
             ),
             
             fluidRow(
               column(5, 
                      h2("single col+rows column"),
                      DT::dataTableOutput('tabla9'),
                      verbatimTextOutput('output7')),
               
               
               column(5, offset = 1,
                      h2("multiple col+rows column"),
                      DT::dataTableOutput('tabla10'),
                      verbatimTextOutput('output8'))
             )
             
    )
    
      )
))
