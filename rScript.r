#Aurhor: Esi Yeboah Yeenuwa
#Final Data Mining Project
#23/04/15

setwd("c:/Esi/AshesiAcademics/Senior2/DataMining/FinalProject")
airports=read.csv("airports.csv",header=T)
gephisummary=read.csv("gephisummary.csv",header=T)
m=merge(airports,gephisummary,by="Label")
m
dev.off() 
plot(m$Longitude,m$Latitude,main="Scatterplot Showing the Geographic Position of Airports and their Modularity Class",xlab="Longitude ", ylab="Latitude",pch=19, col=m$Modularity.Class)
active=read.csv("mostActiveVsLeastActive.csv", header=T)
str(active)
dev.off()
plot(active$Longitude,active$Lagtitude,main="Most active and Least Active Website",xlab="Longitude", ylab="Lagtitude",pch=19,col=ifelse(active$Weighted.Degree>100,"green","yellow"))
colors<- c("green","yellow")
legend("topleft", c("Very Active","Less Active"), cex=0.6,bty="n",fill=colors)

