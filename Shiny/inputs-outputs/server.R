library(shiny)

shinyServer(function(input, output) {

  output$single_slider_out <-renderPrint({
    input$slider_in
  })
  
  output$multiple_slider_out<-renderPrint({
    input$slider_multi
  })
  
  output$num_out<-renderPrint({
    input$num_in
  })
  
  output$single_Date_out <- renderPrint({
    input$single_date
  })
  
  output$chk_out <- renderPrint({
    input$single_chk
  })
  
  output$range_date_out<-renderPrint({
    input$range_date
  })
  
  output$chkout<-renderPrint({
    input$single_chk
  })
  
  output$multi_chk_out<- renderPrint({
    input$multi_chk
  })
  
  output$radio_out<-renderPrint({
    input$radio_in
  })
  
  output$ab_out<-renderPrint({
    input$action_btn
  })
  
  output$al_out<-renderPrint({
    input$action_link
  })

})
