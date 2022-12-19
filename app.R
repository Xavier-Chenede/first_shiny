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
        h2("Number of clic:"),
        h3(textOutput ("result")),
        hr(),
        actionButton(inputId="but1",
                     label="clic!")
        
)
        
x <- 0

server <- function(input, output) {
        
        clic <- eventReactive(input$but1, {
                x <<- x+1
                })
        
        output$result <- renderText({
                clic()
        })
}       

        # Run the application 
shinyApp(ui = ui, server = server)

Y

