# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺
# 𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question. 

# Subset the NEI data by Baltimore's fip.
BaltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate the Baltimore emissions data by year using sum 
AggTotalBaltimore <- aggregate(Emissions ~ year, BaltimoreNEI,sum)

barplot(
  AggTotalBaltimore$Emissions,
  names.arg=AggTotalBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total Emissions PM2.5 from  Baltimore 1999-2008"
)

png("plot2.png",width=480,height=480,units="px",bg="transparent")
dev.off()
