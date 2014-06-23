library(shiny)
data<-read.csv("report_2014-06-19.csv",sep="\t")
data$Date<-as.Date(data$Date, "%Y-%m-%d") 
trim <- function(x) gsub("^\\s+|\\s+$+|\\?", "", x)
replace <- function(x) gsub("unic", "unique", x)
data <- as.data.frame(apply(data, MARGIN = 2, FUN = trim))
data <- as.data.frame(apply(data, MARGIN = 2, FUN = replace))
data <- data[which(data$Question != "Upload other documents" & data$Question != "Upload photos"), ]
data <- data[which(data$Name != "Biblioteca Publica de Drept" & data$Name != "Biblioteca Nationala a Republicii Moldova"), ]
data <- data[data$Raion != "Chisinau", ]
data$Date <- as.Date(data$Date)

data$Answer<-as.numeric(data$Answer)




shinyServer(function(input, output) {
	newset<-reactive({as.data.frame(subset(data,Date >= input$begin1 & Date<=input$end2))})
	
	
	pattern<-reactive({agrep("Number of library users",x=newset()$Question,useBytes=T)})
	all<-reactive({data[pattern(),]})
	
	
	
	output$plot<-renderPrint(
		plot(all()$Answer))						
												 
	})
	
	
