install.packages("pacman")
pacman::p_load(pacman,RColorBrewer,ggplot2,gplots,lattice)
library(datasets)
head(iris)
plot(iris$Species)
plot(iris$Species,iris$Petal.Length)
plot(iris$Petal.Length,iris$Petal.Width)
plot(iris)
plot(iris$Petal.Length,iris$Petal.Width,
     col='#cc0000',  #hex code for red
     pch=19,      #Use solid circles for points
     main="Iris:Petal Length vs Petal Width",
     xlab="Petal Length",
     ylab="Petal Width")
plot(cos,0,2*pi)   #plot(formula,lowerlimit,upperlimit)
plot(dnorm,-3,+3)
plot(dnorm,-3,+3,col="#cc0000",lwd=5,main="Standard Normal Distribution",xlab="z-scores",ylab="density")

# Bar Charts- for quantitave data
?mtcars
head(mtcars)
barplot(mtcars$cyl)
#Need a table with frequencies for each category
cylinders<-table(mtcars$cyl)
barplot(cylinders)

#Basic Histogram
hist(iris$Sepal.Length)
hist(iris$Petal.Length)

#Put multiple graphs ( 3 rows and 1 coloumn)
par(mfrow=c(3,1))

hist(iris$Petal.Width [iris$Species=="setosa"],xlim=c(0,3),breaks=9,main="Petal Width for Setosa",xlab="",col="red")

hist(iris$Petal.Width [iris$Species=="versicolor"],xlim=c(0,3),breaks=9,main="Petal Width for versicolor",xlab="",col="purple")

hist(iris$Petal.Width [iris$Species=="virginica"],xlim=c(0,3),breaks=9,main="Petal Width for virginica",xlab="",col="blue")


par(mfrow=c(1,1))
#clear plots
#dev.off()
