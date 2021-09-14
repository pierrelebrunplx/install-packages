# RUN apt update && \
# sudo apt-get --yes --force-yes install  libgeos-dev
# RUN cd /opt && \
# mkdir packagesICS && \
# cd /opt/packagesICS && \
# R --no-save -e "system('git clone https://github.com/pierrelebrunplx/install-packages.git')" && \
# R --no-save -e "source('/opt/packagesICS/install-packages/Install.R')"


path = "/opt/packagesICS/install-packages/"
#tools::write_PACKAGES(path, type = "source")
#path = "../packages/"
pckgs <- list.files(path,full.names = F,pattern = "tar.gz")
install.packages(pckgs,repos = paste0("file:/",path, pckgs))

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
namedpckgs <- list.files(path,full.names = F)
namedpckgs <- unlist(lapply(strsplit(namedpckgs,"_"),"[[",1))

new.packages <- namedpckgs[!(namedpckgs %in% installed.packages()[,"Package"])]
while(length(new.packages)) {
  install.packages(new.packages,repos = paste0("file:/",path, pckgs))
  new.packages <- pckgs[!(namedpckgs %in% installed.packages()[,"Package"])]
}
