NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")#read table
sub_Balt_Los<-subset(NEI,fips == c("24510","06037"))#make subset of B and L city
SCC_sub<-SCC$EI.Sector
sub_filter1<-SCC_sub%in%grep("Mobile",SCC_sub,value=TRUE)
SCC_motor<-subset(SCC,EI.Sector<-sub_filter1)#filter out subset from SCC by "Mobile"
code1<-SCC_motor$SCC
cf1<-sub_Balt_Los$SCC%in%code1
NEI_motor_B_L<-subset(sub_Balt_Los,SCC==code1)
#filter out subset from B-L-city-subset bsed on code
Q6<-aggregate(NEI_motor_B_L$Emissions,by=list(NEI_motor_B_L$year,NEI_motor_B_L$fips),FUN=sum)
colnames(Q6)<-c("year","City","Emissions")
citynames<-c("Los Angeles","Los Angeles","Los Angeles","Los Angeles","Baltimore","Baltimore","Baltimore","Baltimore")
Q6<-cbind(Q6,citynames)
g<-ggplot(Q6,aes(year,Emissions))
g+geom_point(aes(color=citynames))+facet_grid(.~citynames)+labs(title="Baltimore and Los Angeles PM2.5 Emissions for Motor Vehicle")+geom_smooth()
