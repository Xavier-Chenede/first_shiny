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
        
        h1("Hello Shiny!")
        
)
        
server <- function(input, output) {
                
        }
        # Run the application 
shinyApp(ui = ui, server = server)