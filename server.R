library(shiny)

shinyServer(function(input, output) {
	newset<-reactive({as.data.frame(subset(data,Date >= input$begin1 & Date<=input$end2))})
	output$plot<-renderPrint(
		unique(newset()$Date))														 
})
