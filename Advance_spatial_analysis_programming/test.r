library(sp)
library(raster)
library(GISTools)
library(lattice)
library(latticeExtra)
getwd()
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
Findhorn_Bay=raster("Data/nj0060_dtm.asc")
plot(Findhorn_Bay)
#header<-scan("Data/nj0060_dtm.asc",nlines=6,what=character())
#num1 <- seq(1,length(header),2)
#num2 <- seq(2,length(header),2)
#header.df<- data.frame(labels=header[num1],values=as.numeric(header[num2]))
#View(header.df)
#xmin1<- header.df[3,2]
#ymin1<- header.df[4,2]
#xmax<- header.df[5,2]*header.df[1,2]+xmin1
#ymax<- header.df[5,2]*header.df[2,2]+ymin1
#extent(Findhorn_Bay)<-extent(xmin1,xmax,ymin1,ymax)
#crs(Findhorn_Bay)<-"+proj=longlat +datum=wgs84 +no_defs +ellps=wgs84 +towgs84=0,0,0"


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
    # Change the colors
    col.main="darkgreen", col.lab="black", col.sub="darkgreen",
    # Titles in italic and bold
    font.main = 4, font.lab = 4, font.sub = 3,
    # Change font size
    cex.main = 3, cex.lab = 1.7, cex.sub = 1)+
  box(which="outer",lwd=5,col='blue')+north.arrow(xb=15.75, yb=43.25, len=0.05, lab="N")  +
  north.arrow(xb=15.75, yb=43.25, len=0.05, lab="N")+addnortharrow()+addscalebar()


#Additional Task
Happisburgh<-raster("Happisburgh_Survey_dsm.tiff")
plot3D(Happisburgh)
Happisburgh_mosaic<-raster("Happisburgh_Survey_transparent_mosaic_group1.tiff")
plot3D(Happisburgh_mosaic)