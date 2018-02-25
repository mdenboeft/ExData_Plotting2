# Reading both files in with the function readRDS(). 

if(!exists("NEI")){
  NEI <- readRDS("./Data/summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./Data/Source_Classification_Code.rds")
}

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008

# Aggregate by sum the total emissions by year
AggTotal <- aggregate(Emissions ~ year,NEI, sum)

barplot(
  (AggTotal$Emissions)/10^6,
  names.arg=AggTotal$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total Emissions PM2.5 from US 1999-2008"
)
png("plot1.png",width=480,height=480,units="px",bg="transparent")
dev.off()
