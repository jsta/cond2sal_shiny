source("helpers.R")

shinyServer(
  function(input, output) {
    
    output$saloutput<-renderText({
      paste(cond2sal(input$Conductivity,input$Temperature))
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

        df<-data.frame(read.csv(inFile$datapath,header=input$header,sep=input$sep,quote = input$quote))
        if(ncol(df)<2){
          df$Temperature<-25
        }
        
        df<-data.frame(cond2sal(df[,1],df[,2]))
        names(df)<-"Salinity"
        df
    })
    
})
