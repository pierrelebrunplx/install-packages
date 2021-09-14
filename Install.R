# RUN apt update && \
# sudo apt-get --yes --force-yes install  libgeos-dev
# RUN cd /opt && \
# mkdir packagesICS && \
# cd /opt/packagesICS && \
# R --no-save -e "system('git clone https://github.com/pierrelebrunplx/install-packages.git')" && \
# R --no-save -e "source('/opt/packagesICS/install-packages/Install.R')"



path = "/opt/packagesICS/install-packages/"
#tools::write_PACKAGES("../packages/", type = "source")
#path = "../packages/"
pckgs <- list.files(path,full.names = F,pattern = "tar.gz")
listpckgs = paste0(path, pckgs)
install.packages(listpckgs,repos = NULL)

#these ones do not want to install for unknown reason...
install.packages("BiocManager")
BiocManager::install(version = "3.12")
BiocManager::install("openCyto")
BiocManager::install("cytolib")
#For rgeos : #need to install libraries upfront on terminal using 'sudo apt install libgeos-dev'
install.packages("rgeos")
BiocManager::install("flowDensity")

#need to to it several time to secure depedencies
#(a package won't install in some case if a dependency is not present)
pckgs <- list.files(path,full.names = F)
namedpckgs <- unlist(lapply(strsplit(namedpckgs,"_"),"[[",1))

new.packages <- pckgs[!(namedpckgs %in% installed.packages()[,"Package"])]
new.packages = paste0(path, new.packages)
while(length(new.packages)) {
  install.packages(new.packages,repos = NULL)
  new.packages <- pckgs[!(namedpckgs %in% installed.packages()[,"Package"])]
  new.packages = paste0(path, new.packages)
}

