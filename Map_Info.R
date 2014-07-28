
library(sp)
library(maps)
library(rgdal)
library(extrafont)
loadfonts()

load("~/Map/.RData")

map<-"map.pdf"
cairo_pdf(bg = "transparent", map, width = 11.7, height = 8.3)  #A4
par(family = "Lato Light", las = 1,omi=c(0.5,0,0.5,0),mai=c(0.5,0,0.5,0))
par(mfcol = c(1, 3))
par(ps = 20, cex = 1, cex.main = 1)

#trying different color palettes

#cols <- c("#ffffb2",	"#fecc5c",	"#fd8d3c",	"#f03b20",	"#bd0026")
cols <- c("#C6DBEF",  "#9ECAE1",  "#6BAED6",	"#3182BD",	"#08519C")
#cols <- c("#FFCCAA",  "#FFB380",  "#FF9955",  "#FF7F2A",	"#FF6600")


plot(m,col=cols[m$cut],border="white")
plot(Transnistria,col="grey",add=T, border="white")
text(coordinates(m),labels=m$NAME_1,cex=.4,col="black")
#title(main="Library Users\n as a Percent of Population", col.main="#013383", family="Arial")
vals<-levels(unique(m$cut3))
par( lend = 1 )
legend(x="bottomright",legend=c("9.4 - 15.1","15.2 - 20.9", 
																"21.0 - 26.7","26.8 - 32.5",
																"32.6 - 38.3"), fill=cols,
			 													 title="% of Population",
			 													 bty="n", cex=0.6, y.intersp=2,
			                           box.cex=c(2,2))

mtext("Source: Moldova National Library, 2013",1,line=3,adj=0.5,font=3,cex=0.6)


plot(m,col=cols[m$cut2],border="white")
plot(Transnistria,col="grey",add=T, border="white")


text(coordinates(m),labels=m$NAME_1,cex=.4,col="black")
#title(main="Average Number\n of Visits per User")

legend(x="bottomright",legend=c("5.5 - 8.1","8.2 - 10.5", 
																"10.6 - 13.0","13.1 - 15.6",
																"15.7 - 18.2"), fill=cols,
			 title="Number of Visits",
			 bty="n", cex=0.6, y.intersp=2,
			 box.cex=c(2,2)		)

plot(m,col=cols[m$cut3],border="white")
plot(Transnistria,col="grey",add=T, border="white")
text(coordinates(m),labels=m$NAME_1,cex=.4,col="black")
#title(main="Average Number\n of Loans per User")
legend(x="bottomright",legend=c("12.7 - 20.1","20.2 - 27.5", 
																"27.6 - 35.0","35.1 - 42.3",
																"42.4 - 49.9"), fill=cols,
			 title="Number of Loans",
			 bty="n", cex=0.6, y.intersp=2,
				box.cex=c(2,2),xjust=-1	)

dev.off()

