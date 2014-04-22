gdp <- read.csv("GDP.csv", skip = 4)
edu <- read.csv("EDSTATS_Country.csv")
gdp$X.1 <- as.numeric(gdp$X.1)
gdp$X.4 <- as.numeric(gdp$X.4)
class(gdp$X.1)
class(edu$Income.Group)
gdp <- gdp[which(gdp$X.1 != ""),]
gdp <- gdp[1:190,]
mergeddata <- merge(gdp, edu ,by.x = "X", by.y = "CountryCode")
mergeddata$X.1 <- as.numeric(mergeddata$X.1)
tapply(mergeddata$X.1, mergeddata$Income.Group, mean)