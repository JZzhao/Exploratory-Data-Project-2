NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")#read table
library(ggplot2)
SCC_coal<-SCC$EI.Sector
sub_filter<-SCC_coal%in%grep("Coal",SCC_coal,value=TRUE)
SCC_subcoal<-subset(SCC,EI.Sector<-sub_filter)
#filter out a subset only related with coal
code<-SCC_subcoal$SCC
NEI_coal<-subset(NEI,SCC==code)#filter out a subset based on SCC code
Q4<-aggregate(NEI_coal$Emissions,by=list(NEI_coal$year),FUN=sum)
colnames(Q4)<-c("year","Emissions")
g<-ggplot(Q4,aes(year,Emissions))
g+geom_point()+labs(title="PM2.5 Emissions for Coal Combustion")+geom_smooth()