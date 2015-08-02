source("helpers.R")

shinyServer(
  function(input, output) {
    
    output$saloutput<-renderText({
      paste(cond2sal(input$Conductivity))
    })
    
    output$table<-renderTable({
    inFile<-input$file1
      if(is.null(inFile)){
        return(NULL)
#         ds<-reactive({
#         inFile$datapath<-"cond_examples.csv"
#         input$header<-reactiveTRUE
#         input$sep<-","
#         input$quote<-'"'
#         })
      }

        df<-data.frame(cond2sal(read.csv(inFile$datapath,header=input$header,sep=input$sep,quote = input$quote)[,1]))
        names(df)<-"Salinity"
        df
    })
    
})
