library(shiny)
library(dplyr)
library(ggplot2)


shinyServer(function(input, output) {

  output$tabla1 <- DT::renderDataTable({
    
    mtcars %>%
      DT::datatable(rownames = F,
                    filter = 'top',
                    #extensions = 'Buttons',
                    options = list(
                      pageLength =10,
                      lenghtMenu = c(5,10,15)
                      ##dom='Bfrtip',
                      ##buttons = c('csv')
                    )
                    )
  })
  
  output$tabla2 <- DT::renderDataTable({
    ggplot2::diamonds %>% 
      mutate(volumen  = x*y*z,
             volumen_promedio = mean(volumen),
             volp = volumen/volumen_promedio) %>%
      DT::datatable(filter = 'top') %>%
      formatCurrency(columns = 'price', currency = '$') %>% 
      formatPercentage(columns = 'volp', digits = 2) %>%
      formatString(columns = 'volumen', suffix = 'mm3') %>%
      formatRound(columns = c('volumen','volumen_promedio'), digits = 2)
  })
  
  
  
  #rows
  
  output$tabla3 <- renderDataTable({
    mtcars %>%
      DT::datatable(
        selection = list(
          mode = 'single',
          target = 'row'
        )
      )
  })
  
  
  output$output1 <- renderPrint({
    input$tabla3_rows_selected
  })
  
  output$tabla4 <- renderDataTable({
    mtcars %>%
      DT::datatable(
        selection = list(
          mode = 'multiple',
          target = 'row'
        )
      )
  })
  
  output$output2 <- renderPrint({
    input$tabla4_rows_selected
  })
  
### columns
 
  output$tabla5 <- renderDataTable({
    mtcars %>%
      DT::datatable(
        selection = list(
          mode = 'single',
          target = 'column'
        )
      )
  })
  
  
  output$output3 <- renderPrint({
    input$tabla5_columns_selected
  })
  
  output$tabla6 <- renderDataTable({
    mtcars %>%
      DT::datatable(
        selection = list(
          mode = 'multiple',
          target = 'column'
        )
      )
  })
  
  output$output4 <- renderPrint({
    input$tabla6_columns_selected
  })

  ## cells
  output$tabla7 <- renderDataTable({
    mtcars %>%
      DT::datatable(
        selection = list(
          mode = 'single',
          target = 'cell'
        )
      )
  })
  
  
  output$output5 <- renderPrint({
    input$tabla8_cells_selected
  })
  
  output$tabla8 <- renderDataTable({
    mtcars %>%
      DT::datatable(
        selection = list(
          mode = 'multiple',
          target = 'cell'
          #selectable = matrix(c(1,1,2,2,3,3), nrow =2, byrow = T),
          #selected = matrix(c(1,1,2,2,3,3), nrow =2, byrow = T)
        )
      )
  })
  
  output$output6 <- renderPrint({
    input$tabla8_cells_selected
  })

  ## cols and rows 
  output$tabla9 <- renderDataTable({
    mtcars %>%
      DT::datatable(
        selection = list(
          mode = 'single',
          target = 'row+column'
        )
      )
  })
  
  
  output$output7 <- renderPrint({
    list(
      columns = input$tabla9_columns_selected,
      rows = input$tabla9_rows_selected
    )
  })
  
  output$tabla10 <- renderDataTable({
    mtcars %>%
      DT::datatable(
        selection = list(
          mode = 'multiple',
          target = 'row+column'
        )
      )
  })
  
  output$output8 <- renderPrint({
    list(
      columns =input$tabla10_columns_selected,
      rows = input$tabla10_rows_selected
    )
  })
  
})
