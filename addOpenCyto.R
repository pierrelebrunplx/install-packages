install.packages("BiocManager")
BiocManager::install(version = '3.12',ask = FALSE)
BiocManager::install("openCyto"   ,update = FALSE,ask = FALSE, version = "3.12")
BiocManager::install("cytolib"    ,update = FALSE,ask = FALSE ,version = "3.12")
BiocManager::install("flowDensity",update = FALSE,ask = FALSE ,version = "3.12")
