library(maps)
library(geosphere)
library(dplyr)

#Reading csv files of all outlier coordinates and clade centers coordinates
outl <- file.choose()
outlrd <- read.csv(outl)
outlrd 
cldam <- file.choose()
cldam <- read.csv(cldam)
cldam
cldas <- file.choose()
cldas <- read.csv(cldas)
cldas
cldeu <- file.choose()
cldeu <- read.csv(cldeu)
cldeu
data1 <- (outlrd)
colnames(data1) <- c("longitude","latitude")
data2 <- (cldam)
colnames(data2) <- c("longitude","latitude")
data3 <- (cldas)
colnames(data3) <- c("longitude","latitude")
data4 <- (cldeu)
colnames(data4) <- c("longitude","latitude")

plot_my_connection <- function(dep_lon,dep_lat,arr_lon,arr_lat, color){
  library(geosphere)
  inter <- gcIntermediate(c(dep_lon,dep_lat), c(arr_lon,arr_lat),n=500, addStartEnd=T, breakAtDateLine=F)
  inter <- data.frame(inter)
  lines(subset(inter,lon>=0),col=c(color), lwd=2)
  lines(subset(inter,lon<0),col=c(color), lwd=2)
}


#Creating a world map with a grey background
par(mar=c(0,0,0,0))
maps::map('world',
          col="#b3b3b3", fill=TRUE, bg="#F1F1F0", lwd=0.05,
          mar=rep(0,4),border=0, ylim=c(-80,80) 
)


#Connections from outliers to clade centers
inter <- gcIntermediate(c(10.451526,51.165691), c(4.469936,50.503887), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-3.435973,55.378051), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(-120.7401385,47.7510741), c(-79.3832,43.6532), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

inter <- gcIntermediate(c(-74.0059728,40.7127753), c(-111.093731,34.0489281), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#de0047"), lwd=2)

inter <- gcIntermediate(c(114.305539,30.592849), c(119.7889248,29.1416432), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#ac00ed"), lwd=2)

inter <- gcIntermediate(c(2.213749,46.227638), c(4.469936,50.503887), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(2.213749,46.227638), c(8.227512,46.818188), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(144.9631,-37.8136), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-79.3832,43.6532), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-96.8410503,32.8143702), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

p1 <- c(10.451526,
        51.165691)
p2 <- c(120.960515,
        23.69781)
bezier.arc <- function(p1, p2) {
  
  intercept.long <- (p1[[1]] + p2[[1]]) / 2
  intercept.lat  <- 85
  p3 <- c(intercept.long, intercept.lat)
  
  bezier.curve(p1, p2, p3)
}
arc3 <- bezier.arc(p1,p2)
lines(arc3, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-99.9018131,41.4925374), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-14.452362,14.497401), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#de0047"), lwd=2)

plot_my_connection(-74.0059728,40.7127753,138.252924,36.204824,"#e30091")
plot_my_connection(-120.7401385,47.7510741,144.9631,-37.8136,"#e30091")

inter <- gcIntermediate(c(-120.7401385,47.7510741), c(-89.3985283,40.6331249), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

inter <- gcIntermediate(c(-120.7401385,47.7510741), c(-79.0192997,35.7595731), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(-120.7401385,47.7510741), c(-95.1449017,36.6309594), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

plot_my_connection(-74.0059728,40.7127753,120.960515,23.69781, "#e30091")

inter <- gcIntermediate(c(-74.0059728,40.7127753), c(-8.224454,39.399872), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

plot_my_connection1(-74.0059728,40.7127753,138.252924,36.204824,"#e30091")

inter <- gcIntermediate(c(-74.0059728,40.7127753), c(45.079162,23.885942), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

plot_my_connection(-73.087749,41.6032207,144.9631,-37.8136,"#e30091")

plot_my_connection(-73.087749,41.6032207,120.960515,23.69781,"#e30091")

inter <- gcIntermediate(c(5.291266,52.132633), c(-43.1729,-22.9068), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(5.291266,52.132633), c(144.9631,-37.8136), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-119.4179324,36.778261), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-111.0937311,34.0489281), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#de0047"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(120.960515,23.69781), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#de0047"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-3.74922,40.463667), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-79.3832,43.6532), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(-43.1729,-22.9068), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

inter <- gcIntermediate(c(10.451526,51.165691), c(144.9631,-37.8136), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e30091"), lwd=2)

plot_my_connection4(114.305539,30.392849,-95.7422569,36.2244054,"#ac00ed")

plot_my_connection6(114.305539,30.392849,-88.7878678,43.7844397,"#de0047")

plot_my_connection(114.305539,30.392849,-119.4179324,36.778261,"#ac00ed")

inter <- gcIntermediate(c(114.305539,30.392849), c(-3.435973,55.378051), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(114.305539,30.392849), c(-7.6920536,53.1423672), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(114.305539,30.392849), c(-21.9426,64.1466), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#ac00ed"), lwd=2)

plot_my_connection(114.305539,30.392849,-79.3832,43.6532,"#e800de")

inter <- gcIntermediate(c(2.213749,46.227638), c(-88.7878678,43.7844397), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(2.213749,46.227638), c(-3.435973,55.378051), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(2.213749,46.227638), c(18.4241,-33.9249), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(2.213749,46.227638), c(144.9631,-37.8136), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(-3.435973,55.378051), c(4.469936,50.303887), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(-3.435973,55.378051), c(-14.452362,14.497401), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(-3.435973,55.378051), c(-74.0059728,40.7127753), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(-3.435973,55.378051), c(37.6173,55.7558), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(-3.435973,55.378051), c(-21.9426,64.1466), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#de0047"), lwd=2)

inter <- gcIntermediate(c(-3.435973,55.378051), c(9.501785,56.26392), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#e800de"), lwd=2)

inter <- gcIntermediate(c(-3.435973,55.378051), c(18.4241,-33.9249), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#d90000"), lwd=2)

inter <- gcIntermediate(c(114.305539,30.592849),c(100.992541,15.870032), n=100, addStartEnd=TRUE, breakAtDateLine=F)
lines(inter, col=c("#6300f2"), lwd=2)


#Plotting points for all outlier coordinates and clade centers coordinates
points(x=outlrd$longitude, y=outlrd$latitude, col=c("black"), cex=(.2), pch=16)
points(x=cldam$longitude, y=cldam$latitude, col=c("black"), cex=(.7), pch=16)
points(x=cldeu$longitude, y=cldeu$latitude, col=c("black"), cex=(.7), pch=16)
points(x=cldas$longitude, y=cldas$latitude, col=c("black"), cex=(.7), pch=16)

#1600f7
#8800f0
#e800de
#e1006b
#d90000
#Legend for connection colors based on the number of inferred migrant events at each outlier location
legend(x="bottomleft", legend=c("December 2019", "January 2020", "February 2020", "March 1-7 2020", "March 8-13, 2020", "March 14-17, 2020","March 18-31, 2020"),fil=c("#1600f7","#6300f2","#ac00ed","#e800de","#e30091","#de0047","#d90000"), title="Date of Infered Migration Event")
