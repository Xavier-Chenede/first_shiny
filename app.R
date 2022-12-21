#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plot.matrix)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
        
        h1("Hello Shiny!"),
        hr(),
        h2("Number of clicks:"),
        h3(textOutput ("result")),
        hr(),
        actionButton(inputId="but1",
                     label="click!"),
        actionButton(inputId="but2",
                     label="reset!"),
        hr(),
        numericInput(inputId="lim",
                     label="Limite before auto-reset",
                     value=10),
        hr(),
        h2("Load RDS files and trace"),
        hr(),
        fileInput( inputId = "File_ch",
                   label='Choose model file',
                   multiple = FALSE,
                   accept = NULL,
                   width = NULL,
                   buttonLabel = "Browse...",
                   placeholder = "No file selected",
                   capture = NULL),
        tableOutput("contents"),
        plotOutput("matrx")
)

server <- function(input, output) {
        
  
        v <- reactiveValues(data = 0)
            #clicks incrementation (+1)
            observeEvent(input$but1, {
                v$data<-v$data+1
            })
            
            #clicks count, manual reset (=0)
            observeEvent(input$but2, {
                v$data<-0
            }) 
            
            #clicks compare to autoreset
        click <- eventReactive(input$but1,{
            if (v$data==input$lim+1) {v$data<-0}
        })
        
            #render results depending on current values
       output$result <- renderText({
            if (is.null(click())) {v$data} else {v$data}
            })
       
            #generate R dataset view
        output$contents <- renderTable({
           file <- input$File_ch
           ext  <- tools::file_ext(file$datapath)
           tab <- readRDS(file$datapath)
           tab
           
           # if (!is.null(ext)) {read.csv(file$datapath)}
           # if (!is.null(file)) {read.csv(file$datapath)}
           
           # req(file)
           # validate(need(ext == "csv", "Please upload a csv file"))
           # read.csv(file$datapath, header = input$header)
       })
        
            #View of the dataset in matrix mode view
       output$matrx <- renderPlot({
          file <- input$File_ch
          ext  <- tools::file_ext(file$datapath)
          view <- readRDS(file$datapath)
          plot(view, key=NULL, asp=TRUE,axis.col=NULL, axis.row=NULL, xlab='', ylab='')
       })
}
        
# Run the application 
shinyApp(ui = ui, server = server)





