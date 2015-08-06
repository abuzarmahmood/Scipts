macro "Split Dapi [f1]"
{
run("Clear Results");
run("Set Scale...", "distance=0 known=0 pixel=1 unit=pixel");
rename("Dapi");
run("Split Channels");
selectWindow("Dapi (red)");
close();
selectWindow("Dapi (green)");
close();
}
macro "Create Mask [f2]"{
selectWindow("Dapi (blue)");
setAutoThreshold("Default");
//run("Threshold...");
setThreshold(15, 255);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Fill Holes");
run("Gaussian Blur...", "sigma=2");
setOption("BlackBackground", false);
run("Make Binary");
}
macro "Split Green [f3]"{
run("Set Scale...", "distance=0 known=0 pixel=1 unit=pixel");
rename("Green");
run("Split Channels");
selectWindow("Green (blue)");
close();
selectWindow("Green (red)");
close();
selectWindow("Dapi (blue)");
run("Set Measurements...", "area mean limit redirect=[Green (green)] decimal=3");
run("Analyze Particles...", "size=500-Infinity show=Ellipses display include");
selectWindow("Green (green)");
run("Add Image...", "image=[Drawing of Dapi (blue)] x=0 y=0 opacity=25");
run("Flatten");
run("Copy to System");
run("Close All");
}


