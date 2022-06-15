#Package installation and inclusion
#install.packages("pacman")
pacman::p_load(pacman,RColorBrewer,ggplot2,gplots,lattice,sf,tmap,tmaptools,leaflet,dplyr,maptools,ggspatial,GISTools,prettymapr,rasterVis,rgl)
library(raster)
library(sf)
library(tmap)
library(tmaptools)
library(leaflet)
library(dplyr)
library(maptools)
library(ggspatial)
options("max.contour.segments"= 300000)
#Task 1
matrix_generated<-matrix(floor(runif(10000,min=0,max=255)),100,100)
raster<-raster(matrix_generated)
str(raster)
plot(raster) 
summary(raster)
hist(raster,main="Distribution of cells",xlab="value",ylab="Number of Pixels",col="springgreen")
reclassification_df<-c(-1,25,1,
                           25,50,2,
                           50,75,3,
                           75,100,4,
                           100,125,5,
                           125,150,6,
                           150,175,7,
                           175,200,8,
                           200,225,9,
                           225,255,10)
reclassification_matrix<-matrix(reclassification_df,ncol=3,byrow=TRUE)
classified_raster<-reclassify(raster,reclassification_matrix)
barplot(classified_raster,main="number of pixels in each class")
plot(classified_raster,col=c("black","red","blue","green","white"))

#Task 2
getwd()
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
Findhorn_Bay=raster("Data/nj0060_dtm.asc")
plot(Findhorn_Bay)


class(Findhorn_Bay)
plot(Findhorn_Bay,col=topo.colors(32),xaxt='n',yaxt='n')
Roi_ext=drawExtent()
Roi_Bay=crop(Findhorn_Bay,Roi_ext)

plot(Roi_Bay,col=topo.colors(32))
contour(Roi_Bay,add=TRUE,levels=c(-2,-1,0,1,3,5,8,12,17,23,27,32))
Elevation_classification_df<-c(-3,0,1,
                       0,3,2,
                       3,6,3,
                       6,Inf,4)
Elevation_classification_matrix<-matrix(Elevation_classification_df,ncol=3,byrow=TRUE)
Roi_classified_raster<-reclassify(Roi_Bay,Elevation_classification_matrix)
plot(Roi_classified_raster,topo.colors(10),xaxt='n',yaxt='n')+
  contour(Roi_classified_raster,add=TRUE,levels=c(1,2,3,4))+
  title(
  main = "Findhorn Bay ", sub = "1:Submerged, 2:Semi-Submerged, 3:Coastal Land, 4:Mainland",
  col.main="darkgreen", col.lab="black", col.sub="darkgreen",
  font.main = 4, font.lab = 4, font.sub = 3,
  cex.main = 3, cex.lab = 1.7, cex.sub = 1)+
  box(which="outer",lwd=5,col='blue')+north.arrow(xb=15.75, yb=43.25, len=0.05, lab="N")  +
  north.arrow(xb=15.75, yb=43.25, len=0.05, lab="N")+addnortharrow()+addscalebar()

#Additional Task
Happisburgh<-raster("Happisburgh_Survey_dsm.tiff")
plot3D(Happisburgh)
Happisburgh_mosaic<-raster("Happisburgh_Survey_transparent_mosaic_group1.tiff")
plot3D(Happisburgh_mosaic)
