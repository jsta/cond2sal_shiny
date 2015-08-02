#app deployed to https://jsta.shinyapps.io/cond2sal_shiny

shinyUI(fluidPage(
  titlePanel(h1("Conductivity to Salinity Conversion")),
  navlistPanel(
    tabPanel("Methods",
             mainPanel(
               h2("What is Salinity?"),
               p("Salinity is a numeric measure of water saltiness. Standard oceanic seawater is about 35. The salinty of natural waters can vary from 0 in freshwater lakes, river, and streams to upwards of 50 in hypersaline brine pools."),
               h2("Calculation from Conductivity"),
               p("Modern salinity measurements are generally calculated from direct measurement of electrical conductivity. These direct conductivity measurements are sometimes supplemented by other measurements such as temperature and pressure when high prescision is desired. High precision salinity measurements are important in many oceanographic applications such as density, mixing, and flow modelling."),
              p("This app calculates salinity from conductivity data using the PSS-78 practical salinity equation. In its current form temperature and hydrostatic pressure are assumed to be 25 deg C and 0 dBar respectively."),
              img(src="normal_iil_ian_bf_376.JPG",width=400),
              p(tags$small("Image credit: http://ian.umces.edu/imagelibrary/displayimage-1996.html")),
              strong("Figure: Direct measurement of conductivity using a handheld meter"),
              br(),
              br(),
              p("Use the navigation links in order to convert your data."),
              
              h2("References"),
                p(a(href="http://www.teos-10.org/pubs/TEOS-10_Manual.pdf","IOC,  SCOR  and  IAPSO,  2010: The  international  thermodynamic  equation  of  seawater –  2010:  Calculation  and use of thermodynamic properties.  Intergovernmental Oceanographic Commission, Manuals and Guides No. 56, UNESCO (English), 196 pp")),
              p(a(href="http://cran.r-project.org/package=wq","Alan D. Jassby and James E. Cloern (2015). wq: Some tools for exploring water quality monitoring data. R package version 0.4.4. See the wq::ec2pss function.")),
               p("The", a(href="http://www.github.com/jsta/cond2sal_shiny"," source"),"for this app is on github where you can",a(href="https://github.com/jsta/cond2sal_shiny/issues","report"), "issues and",a(href="https://github.com/jsta/cond2sal_shiny/issues","post"),"feature requests.")
            )),
    "Conversion Data Entry",
    tabPanel("Manual",
             sidebarPanel(h3("Enter Conductivity"),
                numericInput("Conductivity",label = "Manual Conductivity Input (microsiemens)",value=0),
             p(h3("Enter Temperature"),
                numericInput("Temperature",label="Manual Temperature Input (deg C)",value = 25))
             ),
             mainPanel(p(strong(h2("Salinity:",textOutput("saloutput"))))
             
             )),
    tabPanel("File Upload",
             sidebarPanel(h3("Conductivity (microsiemens) or Cond./Temp. (deg c)"),
                          fileInput('file1', 'File CSV Input',
                                    accept=c('text/csv',
                                             'text/comma-separated-values,text/plain',
                                             '.csv')),
                          tags$hr(),
                          checkboxInput('header', 'Header', TRUE),
                          radioButtons('sep', 'Separator',
                                       c(Comma=',',
                                         Semicolon=';',
                                         Tab='\t'),
                                       ','),
                          radioButtons('quote', 'Quote',
                                       c(None='',
                                         'Double Quote'='"',
                                         'Single Quote'="'"),
                                       '"')
                          ),
             mainPanel(p(h2(tableOutput("table")))
                       
             ))
      )
  )
)