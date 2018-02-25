# Reading both files in with the function readRDS(). 

if(!exists("NEI")){
  NEI <- readRDS("./Data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Data/Source_Classification_Code.rds")
}

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Collect subset of NEI data corresponding with vehicles
Vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
VehiclesSCC <- SCC[Vehicles,]$SCC
VehiclesNEI <- NEI[NEI$SCC %in% VehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
BaltimoreVehiclesNEI <- VehiclesNEI[VehiclesNEI$fips=="24510",]

library(ggplot2)

ggp <- ggplot(BaltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y=expression("Total PM Emission (10^5 Tons)")) + 
  labs(title=expression("PM Vehicle Source Emissions Baltimore 1999-2008"))

print(ggp)
png("plot5.png",width=480,height=480,units="px",bg="transparent")
dev.off()
