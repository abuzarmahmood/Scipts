
library(dplyr)
library(abind)
library(EBImage)
folders <- list.dirs(recursive=FALSE,full.names=FALSE)
folders <- paste("C:/Users/am4c3/Documents/ICC_IF/8-2-15 Abu AdipoR1 MTCO1 Nick",folders, sep="/")
for (i in 1:3) {
  setwd(folders[i])
  
if (dir.exists("./maximum projections")==FALSE) {dir.create("./maximum projections")}

data<-data.frame(grep(".tif",dir(),value=TRUE))
groups <- (dim(data)[1])/5
l <- rep(1:groups, each=5)
data<- cbind(data,l)
names(data) <- c("file_name", "group_number")

for (i in 1:length(unique(l))) {
        files <- filter(data, group_number==i)[,1]
        a <- readImage(as.character(files[1]))
        b <- readImage(as.character(files[2]))
        c <- readImage(as.character(files[3]))
        d <- readImage(as.character(files[4]))
        e <- readImage(as.character(files[5]))
        
        z <- abind(a,b,c,d,e)
        max_proj <- apply(z,c(1,2),max)
        writeImage(max_proj,paste("./maximum projections",as.character(files[1]),sep="/"),type="tiff")
}
}