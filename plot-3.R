NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")#read tables
library(ggplot2)
sub_Balt<-subset(NEI,fips == "24510")#make subset for B city
Q3<-aggregate(sub_Balt$Emissions,by=list(sub_Balt$year,sub_Balt$type),FUN=sum)
#calculate the sum of emissions based on year and type
colnames(Q3)<-c("year","type","Emissions")
g<-ggplot(Q3,aes(year,Emissions))
g+geom_point(aes(color=type))+facet_grid(.~type)+labs(title="Baltimore City PM2.5 Emissions by Type")
