# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Reading both files in with the function readRDS(). 

if(!exists("NEI")){
  NEI <- readRDS("./Data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Data/Source_Classification_Code.rds")
}

# Subset coal combustion related NEI data
Combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
Coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
CoalCombustion <- (Combustion & Coal)
CombustionSCC <- SCC[CoalCombustion,]$SCC
CombustionNEI <- NEI[NEI$SCC %in% CombustionSCC,]

library(ggplot2)

ggp <- ggplot(CombustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y=expression("Total PM Emission (10^5 Tons)")) + 
  labs(title=expression("PM Emissions Coal Combustion Sources US 1999-2008"))

print(ggp)
png("plot4.png",width=480,height=480,units="px",bg="transparent")
dev.off()
