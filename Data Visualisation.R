#Basic Visualisation with R

  Thai_tourist <- read.csv("C://Users/Beatrice/OneDrive - University of Salford/Applied Statistic/workshop/Thaitourism1.csv", header = TRUE)
head(Thai_tourist)  
tail(Thai_tourist)
names(Thai_tourist)
str(Thai_tourist)
sum(Thai_tourist)
summary(Thai_tourist)

thai_touristfull <- read.csv("C://Users/Beatrice/OneDrive - University of Salford/Applied Statistic/workshop/Thaitourism2.csv", header = TRUE)
thai_tourisfull
head(thai_touristfull)
tail(thai_touristfull)
names(thai_touristfull)
str(thai_touristfull)
summary(thai_touristfull)

Thai_2016 <- Thai_tourist[Thai_tourist$Year==2016,]
Thai_2016

Thai_2010<- Thai_tourist[Thai_tourist$Year==2010,]
Thai_2010
thai_UK <- thai_touristfull[thai_touristfull$nationality=="UnitedKingdom",]
thai_UK

ThaiSoAsia <- Thai_tourist[Thai_tourist$Region=="SoAsia",]
ThaiSoAsia

plot(Thai_2016$Region,Thai_2016$Tourists_1000s, type="P")
plot(Thai_2016$Region,Thai_2016$Tourists_1000s, type="P", lwd=5)
plot(Thai_2016$Region,Thai_2016$Tourists_1000s, type="P", lwd=3,lty=3, psh = 24)
plot(Thai_tourist$Year,Thai_tourist$Tourists_1000s, pch = 24)
plot(Thai_tourist$Year,Thai_tourist$Tourists_1000s, pch = 19, cex=1)
plot(Thai_tourist$Year,Thai_tourist$Tourists_1000s, pch = 19, cex=1, col="brown")
plot(Thai_tourist$Year,Thai_tourist$Tourists_1000s, pch = 19, cex=1, col=Thai_tourist$Region, name.arg=Thai_tourist$Region)

barplot(Thai_2016$Tourists_1000s)
barplot(Thai_2016$Tourists_1000s, names.arg = Thai_2016$Region)
barplot(Thai_2016$Tourists_1000s, names.arg = Thai_2016$Region, horiz = TRUE)
barplot(Thai_2016$Tourists_1000s, names.arg = Thai_2016$Region, horiz = TRUE, col=c("red","blue"))
barplot(Thai_2016$Tourists_1000s, names.arg = Thai_2016$Region, horiz = TRUE, col=rainbow(9)
hist(thai_UK$tourists, col =rainbow(8))
hist(thai_UK$tourists, breaks = 16, col = rainbow(10))
hist(thai_UK$tourists, breaks = 16, col = rainbow(10),freq = FALSE)
hist(thai_UK$tourists, breaks = 16, col = rainbow(10),labels = TRUE)
hist(thai_UK$tourists, breaks = 16, xlab="No. of UK Tourists per month",col=rainbow(8))
hist(thai_UK$tourists, breaks = 16,ylab="No. of UK Tourists per month",col=rainbow(8))

#subset()function retuns subsets of Vectors,Matrices or data frame which meet conditions.The subset()functions is the easiest way
#to select () variables and obbservation from a large dataset.
#droplevels()function is used to drop unused levels from factors in a data frame.

Thai_europe <- droplevels(subset(thai_touristfull, region=="Europe"))
boxplot(Thai_europe$tourist, data=Thai_europe)
boxplot(tourists~nationality, data = Thai_europe, col=rainbow(8))
boxplot(tourists~nationality, data = Thai_europe, col=rainbow(8),horizontal=TRUE, ylab="region")
#subset an optional vector specifying a subset of observations to be used for Plotting
boxplot(tourists~nationality, data = Thai_europe, col=rainbow(8),horizontal=TRUE, ylab="region",
                                      subset = nationality %in% c("France","Russia", "Germany"))

#Pie()function draws a piechart to summerise the categorical division of a datadet into subgroups. the additionalparameter
#are used to control labels, Colours. Title E.C.T.
#DATA must be a numerical vector of positive values.
pie(Thai_2016$Tourists_1000s, col = rainbow(30),labels = Thai_2016$Region)

#to add percentage to the labels
percent <- round(100*Thai_2016$Tourists_1000s/sum(Thai_2016$Tourists_1000s),1)
percent <-paste(Thai_2016$Region, "-",percent,"%")#add percent to labels,paste()function is simply concatenates the vector with space seperator.
pie(Thai_2016$Tourists_1000s, labels = percent,col = rainbow(25))

#ggplot,s  offers a powerful grafic language for creating elegant and complex plots.
#it works much like plot()function.however there are addiional funtions in ggplot2,
#that allows you to make arbitrarily sophisticated plots.qplot is used to create the most common graph types

install.packages("ggplot2")
library(ggplot2)
#scatterplot with qplot()function

qplot(Region, Tourists_1000s,data = Thai_tourist)
qplot(Region, Tourists_1000s,data = Thai_tourist, colour = Year)
qplot(Region, Tourists_1000s,data = Thai_tourist, colour = Year, size = I(9))
#boxplot with qplot()function

qplot(Region, Tourists_1000s,data = Thai_tourist, geom = "boxplot", fill="red")

qplot(tourists,data = thai_UK, geom = "histogram", fill="red")
#density plot with qplot() fuunction

qplot(tourists, data=thai_UK, geom = "density",fill="red")
qplot(Occupancy_data$Temperature, geom = "histogram", fill="red")
qplot(Occupancy_data$Humidity, geom = "histogram",fill= "red")
      