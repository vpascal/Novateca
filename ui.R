library(shiny)

data<-read.csv("report_2014-06-19.csv",sep="\t")
data$Date<-as.Date(data$Date, "%Y-%m-%d") 



shinyUI(pageWithSidebar(

	headerPanel("Novateca  Datat App"),

	sidebarPanel(
		selectInput("begin1", "Begin date:", choices=unique(data$Date),selected="2013-06-01"),
		selectInput("end2", "End date:", choices=unique(data$Date),selected="2014-02-01")),

	mainPanel(
		plotOutput("plot")
	)
))