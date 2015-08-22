NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")#read table
sub1999<-subset(NEI,year=="1999")
sub2002<-subset(NEI,year=="2002")
sub2005<-subset(NEI,year=="2005")
sub2008<-subset(NEI,year=="2008")#make subets of different years
year<-c(1999,2002,2005,2008)
Emissions<-c(sum(sub1999$Emissions),sum(sub2002$Emissions),sum(sub2005$Emissions),sum(sub2008$Emissions))
Q1<-data.frame(cbind(year,Emissions))#form a data frame with year and sum
png("plot-1.png",width = 480,height = 480)
plot(Q1$year,Q1$Emissions,xlab = "year",ylab = "Emissions",main = "PM2.5 Total Emissions from 1999 to 2008")
abline(lm(Q1$Emissions~Q1$year),lwd=2,col="black")
dev.off()