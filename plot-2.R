NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")#read tables
sub_Balt<-subset(NEI,fips == "24510")# make subset of B city
sub_Balt1999<-subset(sub_Balt,year=="1999")
sub_Balt2002<-subset(sub_Balt,year=="2002")
sub_Balt2005<-subset(sub_Balt,year=="2005")
sub_Balt2008<-subset(sub_Balt,year=="2008")# make subset of different years for B city
year<-c(1999,2002,2005,2008)
Emissions_Balt<-c(sum(sub_Balt1999$Emissions),sum(sub_Balt2002$Emissions),sum(sub_Balt2005$Emissions),sum(sub_Balt2008$Emissions))
Q2<-data.frame(cbind(year,Emissions_Balt))# make data frame with year and sum
png("plot-2.png",width = 609,height = 370)
plot(Q2$year,Q2$Emissions_Balt,xlab = "year",ylab = "Emissions",main = "Baltimore City PM2.5 Total Emissions from 1999 to 2008")
dev.off()