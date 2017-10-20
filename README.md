<h1><img src = "https://github.com/chasemc/IDBac/blob/master/ico/Picture1.png?raw=true" height="60" align="left">  IDBac Pre-Beta </h1>
 




### Download the Excel template for renaming raw MALDI files:
https://github.com/chasemc/IDBac_App/blob/master/MALDI-Plate_Template/384_Spot_MALDI_Template.xltx

  
  

### Download/Install the IDBac Application


#### Currently IDBAC comes in two forms:

1. For those uncomfortable with using R there is an easy-installer
    * The current stable Version "0.0.1" may be downloaded from here:
2. For those even slightly familiar with R IDBac may be downloaded as a package by following the directions below


#### Why you would want to use R instead of the easy-install:

* To help ensure IDBac doesn't break we make sure the user has the same version of R installed as was used in our
testing.  This means it may install another version of R on your system than you currently use.


#### Code to use IDBac from R:
The R code below will, if needed, install "devtools" for downloading IDBac; and the R packages necessary for IDBac to function.
```
Install_And_Load <- function(Required_Packages)
{  Remaining_Packages <- Required_Packages[!(Required_Packages %in% installed.packages()[, "Package"])]
  if (length(Remaining_Packages)) {
    install.packages(Remaining_Packages)  }
  for (package_name in Required_Packages)  {
    library(package_name,
            character.only = TRUE,
            quietly = TRUE)  } }
# Required packages to install and load
Required_Packages = c("devtools","BiocInstaller","snow","parallel","shiny", "MALDIquant", "MALDIquantForeign", "readxl","networkD3","factoextra","ggplot2","ape","FactoMineR","dendextend","networkD3","reshape2","plyr","dplyr","igraph","rgl")
# Install and Load Packages
Install_And_Load(Required_Packages)

source("https://bioconductor.org/biocLite.R")
# Change FALSE to TRUE if you would like to be prompted before updating bioconductor packages during the execution of the below function
biocLite("mzR",ask=FALSE)


```



Once you have installed the necessary packages above, install IDBac using the code below:

```
devtools:installGithub("https://github.com/chasemc/IDBac")
```


You can then start an instance of IDBac using the following command:

```
IDBac::runIDBac()
```



#### Tips and Tricks
Since IDBac is a Shiny app it can run multiple instances.  To do this, start IDBac and simply copy the address from the address bar in your browser into a new window or tab in your internet browser.
