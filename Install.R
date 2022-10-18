## DOCKERFILE INSTRUCTIONS
#RUN apt update && \
# sudo apt-get --yes --force-yes install  libudunits2-dev libgdal-dev libgeos-dev libproj-dev
#RUN cd /opt && \
# mkdir packagesICS && \
# cd /opt/packagesICS && \
# R --no-save -e "system('git clone https://github.com/pierrelebrunplx/install-packages.git')" && \
# R --no-save -e "source('/opt/packagesICS/install-packages/Install.R')"



path = "/opt/packagesICS/install-packages/"
#tools::write_PACKAGES("../packages/", type = "source")
#path = "../packages/"

install.packages("sf")

#pckgs <- list.files(path,full.names = F,pattern = "tar.gz")
#listpckgs = paste0(path, pckgs)
#install.packages(listpckgs,repos = NULL)

#these ones do not want to install for unknown reason...
install.packages("BiocManager")
BiocManager::install(version = "3.15",ask = FALSE)
BiocManager::install("openCyto",ask = FALSE,update = FALSE)
BiocManager::install("cytolib",ask = FALSE, update = FALSE)
BiocManager::install("flowDensity",ask = FALSE, update = FALSE)
BiocManager::install('flowAI',ask = FALSE,update = FALSE)
BiocManager::install('ggcyto',ask = FALSE,update = FALSE)

install.packages(c("shiny","tools", "parallel", "plyr","dplyr","tidyr","reshape2","rhandsontable","openxlsx","DT","callr"))

#need to to it several time to secure depedencies
#(a package won't install in some case if a dependency is not present)
#namedpckgs <- unlist(lapply(strsplit(pckgs,"_"),"[[",1))

#new.packages <- pckgs[!(namedpckgs %in% installed.packages()[,"Package"])]
#i=1
#while(length(new.packages) & i <5) { #try 5 times max
#  new.packages = paste0(path, new.packages)
#  install.packages(new.packages,repos = NULL)
#  new.packages <- pckgs[!(namedpckgs %in% installed.packages()[,"Package"])]
#  i = i + 1
#}

