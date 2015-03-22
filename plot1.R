# Plot emissions over year

#prepare data
library(dplyr)

NEI_by_year <- group_by(NEI, year)
emmissions_by_year <- summarise(NEI_by_year, total_emissions = sum(Emissions))

#create plot
png(filename="plot1.png")
plot(emmissions_by_year$year, emmissions_by_year$total_emissions, type="l",  main="Total emissions per year", ylab="PM2.5 (tons)", xlab="Year", col="blue")
dev.off()