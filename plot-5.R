NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")#read table
library(ggplot2)
sub_Balt<-subset(NEI,fips == "24510")#make subset of B city 
SCC_sub<-SCC$EI.Sector
sub_filter1<-SCC_sub%in%grep("Mobile",SCC_sub,value=TRUE)
SCC_motor<-subset(SCC,EI.Sector<-sub_filter1)
# filter out subset from SCC by "Mobile" representing motor vehicles
code1<-SCC_motor$SCC
cf<-sub_Balt$SCC%in%code1
NEI_motor_B<-subset(sub_Balt,SCC<-cf)#filter subset from B-city-subset by code
Q5<-aggregate(NEI_motor_B$Emissions,by=list(NEI_motor_B$year),FUN=sum)
colnames(Q5)<-c("year","Emissions")
g<-ggplot(Q5,aes(year,Emissions))
g+geom_point()+labs(title="Baltimore City PM2.5 Emissions for Motor Vehicle")+geom_smooth()