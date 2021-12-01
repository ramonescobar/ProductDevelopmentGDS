
library(dplyr)
library(shiny)

shinyUI(fluidPage(

    titlePanel("Cargando archivos"),
    sidebarLayout(
      sidebarPanel(
        
        fileInput("cargar_archivo",
                  "Cargar archivo",
                  buttonLabel = "Buscar",
                  placeholder = "No hay archivo seleccionado"),
        
        dateRangeInput('rango_fechas',
                       'Selecione fechas',
                       min = '1900-01-05',
                       max = '2007-0-30',
                       start = '1900-01-05',
                       end = '2007-09-30',
                       ),
        
        downloadButton(
          'download_dataframe',
          'Descargar archivo'
        ),
        
      ),
      mainPanel(
        DT::dataTableOutput("contenido_archivo")
      )
    )

))
