

library(shiny)


shinyUI(fluidPage(


    titlePanel("Interacciones del usuario con graficas"),
    
    tabsetPanel(
      tabPanel('Graficas shyni',
               h1("Graficas en shiny"),
               plotOutput('grafica_base_r'),
               plotOutput('grafica_ggplot')
               ),
      
      tabPanel('Interacciones con plot',
               plotOutput('plot_click_option',
                          click = 'clk',
                          dblclick = 'dclk',
                          hover = 'mouse_hover',
                          brush = 'mouse_brush'),
               
               verbatimTextOutput('click_data'),
               
               tableOutput('mtcars_tbl')
               )
    )

))
