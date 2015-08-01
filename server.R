source("helpers.R")

shinyServer(
  function(input, output) {
    
    output$saloutput<-renderText({
      paste(cond2sal(input$Conductivity))
    })
})
