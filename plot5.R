# Plot motor vehicle emissions in Baltimore over year by type

#prepare data
library(dplyr)

NEI_baltimore_onroad <- filter(NEI, fips == 24510, type=="ON-ROAD")
NEI_baltimore_onroad_by_year <- group_by(NEI_baltimore_onroad, year)
emmissions_baltimore_onroad_by_year <- summarise(NEI_baltimore_onroad_by_year, total_emissions = sum(Emissions))

#create plot
library(ggplot2)

png(filename="plot5.png")
p <- qplot(year, total_emissions, main="Total motor vehicle emissions per year in Baltimore by type", data=emmissions_baltimore_onroad_by_year, geom=c("point", "line"))
print(p)
dev.off()