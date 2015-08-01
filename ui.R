#app deployed to https://jsta.shinyapps.io/cond2sal_shiny

shinyUI(fluidPage(
  titlePanel(h1("Conductivity to Salinity Conversion")),
  
  sidebarLayout(
    sidebarPanel(h1("Enter Conductivity"),
                 numericInput("Conductivity",label = "Conductivity Input (microsiemens)",value=0)),
    mainPanel(p(h2("The salinity of your sample is:",textOutput("saloutput"))),
              br(),
              br(),
              br(),
                p("This app assumes a water temperature of 25 deg. C and a pressure of 0 atm."),
                p("Salinity is a numeric measure of the water saltiness. Standard oceanic water is about 32, while freshwater is 0. In some parts of the word, seawater can be higher than 40. In this case the water is said to be", strong("hypersaline"),"."),
    p("According to the",a("Intergovernmental Oceanographic Commission (IOS)")),img(src="normal_iil_ian_bf_376.JPG",width=400),
    p("Credit: http://ian.umces.edu/imagelibrary/displayimage-1996.html"),
    p("The source for this app is on github at: http://www.github.com/jsta/cond2sal_shiny")
    )
  )
))
