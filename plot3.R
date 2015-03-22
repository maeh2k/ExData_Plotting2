# Plot emissions in Baltimore over year by type

#prepare data
library(dplyr)

NEI_baltimore <- filter(NEI, fips == 24510, year == 1999 | year == 2008)
NEI_baltimore_by_year_and_type <- group_by(NEI_baltimore, type, year)
emmissions_baltimore_by_year_and_type <- summarise(NEI_baltimore_by_year_and_type, total_emissions = sum(Emissions))

#create plot
library(ggplot2)

png(filename="plot3.png")
p <- qplot(year, total_emissions, main="Total emissions per year in Baltimore by type", data=emmissions_baltimore_by_year_and_type, geom=c("point", "line"), color=type)
print(p)
dev.off()
