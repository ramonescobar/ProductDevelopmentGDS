

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("ui dinamico"),
    tabsetPanel(
      
      tabPanel("Ejemplo 1", 
               numericInput("min1","limite inferior", value = 5),
               numericInput("max1","limite superior",value = 15),
               sliderInput("slider1","seleccione valor", 
                           min =0, max = 15, value = 10)),
      
      tabPanel("Ejemplo 2",
               sliderInput("s1","seleccione el valor",min = -5, max=5, value=0),
               sliderInput("s2","seleccione el valor",min = -5, max=5, value=0),               
               sliderInput("s3","seleccione el valor",min = -5, max=5, value=0),
               sliderInput("s4","seleccione el valor",min = -5, max=5, value=0),               
               actionButton('reset',"Reiniciar")),
      
      
      tabPanel("Ejemplo 3", 
               numericInput("n", "corridas",value = 10),
               actionButton("correr", "correr")
               ),
      
      
      tabPanel("Ejemplo 4",
               numericInput('nvalue','valor', value = 0)
               ),
      
      
      
      tabPanel("Ejemplo 5", 
               numericInput("celcius", "Temperatura en celsius", value = NA),
               numericInput("farenheit", "Temperatura en farenheit", value = NA)
               ),
      
      tabPanel("Ejemplo 6",
               
               selectInput('dist','selccione distribucion',
                           choices = c('Normal','Uniforme','Exponencial')),
               
               numericInput('n_random','Cuantos numero aleatorios', value = 100, min=0),
               hr(),
               
               tabsetPanel(id='params', 
                           type = 'hidden',
                           tabPanel('Normal',
                                    h1("Distribucion Normal"),
                                    numericInput('media','media', value = 0),
                                    numericInput('sd','sd', value = 1)
                                    ),
                                                      
                           tabPanel('Uniforme',
                                    h1("Distribucion uniforme"),
                                    numericInput('unif_min','minimo', value = 0),
                                    numericInput('unif_max','maximo', value = 1)
                           ),
                                                      
                           tabPanel('Exponencial',
                                    h1("Distribucion exponencial"),
                                    numericInput('razon','razon', value = 1, min=0),
                           )),
               
                plotOutput('plot_dist'))
    )

))
