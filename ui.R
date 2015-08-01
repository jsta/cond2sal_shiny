shinyUI(fluidPage(
  titlePanel(h1("Conductivity to Salinity Conversion")),
  
  sidebarLayout(position="right",
    sidebarPanel(h1("Enter Conductivity"),
                 numericInput("Conductivity",label = "Conductivity Input",value=0)),
    mainPanel(p("Salinity is a numeric measure of the water saltiness. Standard oceanic water is about 32, while freshwater is 0. In some parts of the word, seawater can be higher than 40. In this case the water is said to be", strong("hypersaline"),"."),
              
    p("According to the",a("Intergovernmental Oceanographic Commission (IOS)")),img(src="normal_iil_ian_bf_376.JPG",width=400))
  )
))
