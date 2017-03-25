NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
scclist2 <- as.data.frame(SCC[vehicles,1])
scclist2 <- apply(scclist2,1,as.character)
vehiclePM2.5 <- NEI[NEI$SCC %in% scclist2 & NEI$fips=="24510", ]
vehicletotal <- aggregate(vehiclePM2.5$Emissions,by=list(Year=vehiclePM2.5$year),FUN=sum)

vehiclePM2.5_2<- NEI[NEI$SCC %in% scclist2 & NEI$fips=="06037", ]
vehicletotal2 <- aggregate(vehiclePM2.5_2$Emissions,by=list(Year=vehiclePM2.5_2$year),FUN=sum)
cities <-cbind(vehicletotal,vehicletotal2[,2])
colnames(cities) <- c("Year","Baltimore","Los Angeles")
png("plot6.png",width=480,height=480)
plot(cities$Year,cities$Baltimore,type="o",col="red",ylim=c(0,7400))
points(cities$Year,cities$`Los Angeles`,type="o",col="blue")

dev.off()
