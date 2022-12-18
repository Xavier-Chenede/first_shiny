#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for app that draws a histogram ----
ui <- fluidPage(
        
        h1("Hello Shiny!"),
        hr(),
        h2("h2 format"),
        hr(),
        
        actionButton(inputId="but1",
                     label="Add +1"),
        
        textOutput('result')
)
        

server <- function(input, output) {
        
        x <- 0
        clic <- eventReactive(input$but1, {
                x <- x+1
        }, ignoreNULL = FALSE)  
        
        
        
        observe({
                if(input$but1 > 0){
                        output$result=clic
                        }
        })
        

}

        # Run the application 
shinyApp(ui = ui, server = server)

