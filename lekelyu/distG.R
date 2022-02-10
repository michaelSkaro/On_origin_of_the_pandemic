options(warn=-1)
args = commandArgs(trailingOnly=TRUE)
library(ape)
library(ggplot2)
library(magrittr)
library(dplyr)

#function for calculate the average distance within the group, or between the groups
averageSelfDist <- function(m) {
  return(mean(m[lower.tri(m, diag = FALSE)]))
}
averagePairDist <- function(m) {
  return(mean(m))
}

#wrap function
printM <- function(f) {
  #save the sequence fule and calcualte the distance matrix
  ge <- read.dna(f, format = "fasta")
  isolateName <- labels.DNAbin(ge)
  distG <- dist.dna(ge,model="raw",as.matrix = TRUE)

  #find the index for each group
  mers <- c("5-addit-3228_S57_L001","9-addit-3228_S67_L001","NC4713-3228_S51_L001","NC4714-3228_S73_L001","8-addit-3228_S38_L001")
  mers_index <- grep(paste(mers,collapse="|"),isolateName)
  pangolin_index <- grep("pangolin",isolateName)
  bat <- c("Rhinolophus","bat","Hipposideros","Rousettus")
  bat_index <- grep(paste(bat,collapse="|"),isolateName)
  all_index <- c(1:length(isolateName))
  human_index <- all_index[!all_index %in% c(mers_index,pangolin_index,bat_index)]

  #print distances
  print(paste0("human: ", averageSelfDist(distG[human_index,human_index])))
  print(paste0("bat: ", averagePairDist(distG[bat_index,human_index]), " ", averageSelfDist(distG[bat_index,bat_index])))
  print(paste0("pangolin: ", averagePairDist(distG[pangolin_index,human_index]), " ", averagePairDist(distG[pangolin_index,bat_index]), " ", averageSelfDist(distG[pangolin_index,pangolin_index])))
  print(paste0("mers: ", averagePairDist(distG[mers_index,human_index]), " ", averagePairDist(distG[mers_index,bat_index]), " ", averagePairDist(distG[mers_index,pangolin_index]), " ", averageSelfDist(distG[mers_index,mers_index])))
}


for(f in list.files(args[1])){
  print(f)
  printM(paste0(args[1],"/",f))
}

