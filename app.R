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
        h2("Number of click:"),
        h3(textOutput ("result")),
        hr(),
        actionButton(inputId="but1",
                     label="click!"),
        actionButton(inputId="but2",
                     label="reset!")
        
)
        
x <- 0

server <- function(input, output) {
        
        # click <- eventReactive(input$but1,{
        #         if (x==100) {x<<-1} else {x <<- x+1} #resetting if 100th click
        #         })
        # 
        # click_rz <- eventReactive(input$but2,{
        #         x<<-1 #resetting at click
        #         })
        # 
        # # output$result <- renderText({
        # #         click()
        # #         })
        # 
        # output$result <- renderText({
        #         if (input$but2>0) {click_rz()} else {click}
        #         })

        v <- reactiveValues(data = x)
    
            observeEvent(input$but1, {
                v$data<-v$data+1
            })
            
            observeEvent(input$but2, {
                v$data<-0
            })  
            
            output$result <- renderText({
                v$data 
            })
        }
        
                # Run the application 
shinyApp(ui = ui, server = server)





