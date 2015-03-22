# Plot emissions in Baltimore over year

#prepare data
library(dplyr)

NEI_baltimore <- filter(NEI, fips == 24510)
NEI_baltimore_by_year <- group_by(NEI_baltimore, year)
emmissions_baltimore_by_year <- summarise(NEI_baltimore_by_year, total_emissions = sum(Emissions))

#create plot
png(filename="plot2.png")
plot(emmissions_baltimore_by_year$year, emmissions_baltimore_by_year$total_emissions, type="l",  main="Total emissions per year in Baltimore", ylab="PM2.5 (tons)", xlab="Year", col="blue")
dev.off()
