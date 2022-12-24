#external code to the app

v <- reactiveValues(data = 0)
#clicks incrementation (+1)
observeEvent(input$but1, {
        v$data<-v$data+1
})

print("Hello")