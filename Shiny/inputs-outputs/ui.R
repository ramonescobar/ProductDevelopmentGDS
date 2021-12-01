library(shiny)
library(lubridate)


shinyUI(fluidPage(
  titlePanel('Shiny Inputs Ejemplos'),
  sidebarLayout(
    sidebarPanel(
      
      sliderInput('slider_in','Seleccione un valor',
                  min = 0, max = 100, value = 50,
                  step = 10, post = '%',
                  animate = animationOptions(interval = 250, loop = T)
                  ),
      
      sliderInput('slider_multi','seleccione un rango',
                  min = -10, max = 10, value = c(-5,5)
                  ),
      
      numericInput('num_in','Ingrese valor',
                   min = 0, max = 50, value = 25
                   ),
      
      dateInput('single_date',"Fecha de cumpleanos",
                value = today(),
                language = 'es',
                weekstart = 1,
                format = 'dd-mm-yyyy'
                ),
      
      dateRangeInput('range_date','Seleccione rango de fechas',
                     max=today(), 
                     min = today()-365, 
                     start = today()-7,
                     end = today(),
                     language = 'es',
                     weekstart = 1,
                     separator = 'a'),
      
      checkboxInput('single_chk',"Mostrar", value = T),
      
      checkboxGroupInput('multi_chk', "Seleccione nivel", choices = 1:5, selected = 1),
      
      radioButtons('radio_in', "seleccione genero",
                   choices = c('Masculino','Femenino','Otro'),
                   selected = 'Femenino', inline = F),
      
      actionButton('action_btn',"Refrescar"),
      br(),
      actionLink('action_link','Salir'),
      
      #submitButton("Ejecutar")
      
      ),
    mainPanel(
      h1("Salida de los inputs de shiny"),
      h2("slider IO"),
      verbatimTextOutput('single_slider_out'),
      h2('Slider multiple IO'),
      verbatimTextOutput('multiple_slider_out'),
      h2("Numeric IO"),
      verbatimTextOutput('num_out'),
      h2('Date IO'),
      verbatimTextOutput('single_Date_out'),
      h2("Date Range IO"),
      verbatimTextOutput('range_date_out'),
      h2("checkbox IO"),
      verbatimTextOutput('chk_out'),
      h2("Checkbox group IO"),
      verbatimTextOutput('multi_chk_out'),
      h2("radio IO"),
      verbatimTextOutput('radio_out'),
      h2("Action Button IO"),
      verbatimTextOutput('ab_out'),
      h2("Action link IO"),
      verbatimTextOutput('al_out')
      
    )
  )
))
