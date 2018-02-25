# Of the four types of sources indicated by the (point, nonpoint, onroad, nonroad) type variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Reading both files in with the function readRDS(). 
if(!exists("NEI")){
  NEI <- readRDS("./Data/summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./Data/Source_Classification_Code.rds")
}

# Subset the NEI data by Baltimore's fip.
BaltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate the Baltimore emissions data by year using sum 
AggTotalBaltimore <- aggregate(Emissions ~ year, BaltimoreNEI,sum)

library(ggplot2)

ggp <- ggplot(BaltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y=expression("Total PM Emission (Tons)")) + 
  labs(title=expression("PM Emissions by source, Baltimore City 1999-2008"))

print(ggp)
png("Plot3.png",width=480,height=480,units="px",bg="transparent")
dev.off()
