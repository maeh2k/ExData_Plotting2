# Plot motor vehicle emissions in Baltimore over year by type

#prepare data
library(dplyr)

NEI_onroad <- filter(NEI, type=="ON-ROAD", fips == "24510" | fips == "06037")
NEI_onroad_by_year <- group_by(NEI_onroad, year, fips)
fips2county <- data.frame(fips=c("06037", "24510"), county=c("Los Angeles County", "Baltimore City"), stringsAsFactors = TRUE)
emmissions_onroad_by_year <- summarise(NEI_onroad_by_year, total_emissions = sum(Emissions))
emmissions_onroad_by_year <- full_join(emmissions_onroad_by_year, fips2county)


#create plot
library(ggplot2)

png(filename="plot6.png")
p <- qplot(year, total_emissions, main="Total motor vehicle emissions per year", data=emmissions_onroad_by_year, geom=c("point", "line"), color=county)
print(p)
dev.off()