NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
library(dplyr)
baltPM2.5_new <- Balt %>% 
  group_by(type, year) %>%                # multiple group columns
  summarise(totalPM2.5 = sum(Emissions))  # multiple sum columns
str(baltPM2.5_new)
### ggplot(baltPM2.5_new,aes(year,totalPM2.5),col=factor(type)) + geom_line()
png("plot3.png",width=480,height=480)
qplot(year,totalPM2.5,data=baltPM2.5_new,color=factor(type))+geom_line()

dev.off()
