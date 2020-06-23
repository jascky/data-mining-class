#Practice
#Filter countries by Low income
stats[stats$Income.Group == "Low income", "Country.Name", drop=F]
#Filter countries by Lower middle income
stats[stats$Income.Group == "Lower middle income", "Country.Name", drop=F]
#Filter countries by Upper middle income
stats[stats$Income.Group == "Upper middle income", "Country.Name", drop=F]
#Filter by countrie Malta
stats[stats$Country.Name == "Malta",]
#Filter by countrie Qatar
stats[stats$Country.Name == "Qatar",]
#Filter by countrie Netherlands
stats[stats$Country.Name == "Netherlands",]
#Filter by countrie Norway
stats[stats$Country.Name == "Norway",]