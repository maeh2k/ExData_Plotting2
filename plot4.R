# Plot coal combustion-related emissions

#prepare data
library(dplyr)

SCC_coal_comb_related <- filter(SCC, grepl("Fuel Comb .* Coal", EI.Sector))

NEI_coal <- filter(NEI,  NEI$SCC %in% SCC_coal_comb_related$SCC)
NEI_coal_by_year <- group_by(NEI_coal, year)
emmissions_coal_by_year <- summarise(NEI_coal_by_year, total_emissions = sum(Emissions))

#create plot
library(ggplot2)

png(filename="plot4.png")
p <- qplot(year, total_emissions, main="Coal combustion-related emissions", data=emmissions_coal_by_year, geom=c("point", "line"))
print(p)
dev.off()