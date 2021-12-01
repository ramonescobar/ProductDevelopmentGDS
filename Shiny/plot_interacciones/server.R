library(shiny)
library(ggplot2)
library(dplyr)


shinyServer(function(input, output) {

  output$grafica_base_r <-renderPlot({
    plot(mtcars$wt, 
         mtcars$mpg, 
         xlab ='wt',
         ylab = 'Millas por galon')
  })
  
  output$grafica_ggplot <-renderPlot({
    diamonds %>%
      ggplot(aes(x = carat, y =price, color = color))+
      geom_point()+
      xlab('Precio')+
      ylab('Kilates')+
      ggtitle('PRecio de diamantes por kilate')
  })
  
  output$click_data<-renderPrint({
    list(
      click_xy = c(input$clk$x , input$clk$y),
      doble_clik = c(input$dclk$x, input$dclk$x),
      hover_xy = c(input$mouse_hover$x, input$mouse_hover$y),
      brush_xy = c(
        input$mouse_brush$xmin,input$mouse_brush$ymin,
        input$mouse_brush$xmax, input$mouse_brush$ymax
      )
    )
    
  })
  
  output$mtcars_tbl <- renderTable({
    df <- brushedPoints(mtcars,input$mouse_brush,xvar = 'wt', yvar ='mpg')
    #df <- nearPoints(mtcars,input$clk,xvar = 'wt', yvar ='mpg')
  })
  
  output$plot_click_option <-renderPlot({
    plot(mtcars$wt, 
         mtcars$mpg, 
         xlab ='wt',
         ylab = 'Millas por galon'
    )
    
    points(
      input$clk$x , input$clk$y,
      col ='green'
    )
    
    points(
      input$mouse_hover$x, input$mouse_hover$y,
      col ='gray'
    )
    
    points(
      input$dclk$x, input$dclk$y
    )
    
    
    
    df <- brushedPoints(mtcars,input$mouse_brush,xvar = 'wt', yvar ='mpg')
    points(
      df$wt, 
      df$mpg, 
      col ='green'
    )
    
    
  })
  

})
