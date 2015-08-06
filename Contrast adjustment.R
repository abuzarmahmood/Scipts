if (dir.exists("./contrast_adj")==FALSE) {dir.create("./contrast_adj")}
direc <- dir()[grepl(".tif", dir())]
for (i in 1:length(direc)) {
  z <- readImage(direc[i]) 
  z <- z*2
  writeImage (z, files = paste("./contrast_adj/",direc[i]))
  }