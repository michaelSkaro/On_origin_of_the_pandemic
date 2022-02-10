#Rscript /Users/leke/Desktop/coronaVirus/heatmap.R /Users/leke/Desktop/coronaVirus/gene/S_al.fasta 
options(warn=-1)
args = commandArgs(trailingOnly=TRUE)
library(ape)
library(ggplot2)
library(magrittr)
library(dplyr)

#save the sequence file and calculate the distance matrix
S <- read.dna(args[1], format = "fasta")
isolateName <- labels.DNAbin(S)
distS <- dist.dna(S,model="raw",as.matrix = TRUE)

#find the index for each group
mers <- c("5-addit-3228_S57_L001","9-addit-3228_S67_L001","NC4713-3228_S51_L001","NC4714-3228_S73_L001","8-addit-3228_S38_L001")
mers_id <- mers %>% paste(.,collapse="|") %>% grep(.,isolateName) %>% isolateName[.]
pangolin_id <- grep("pangolin",isolateName) %>% isolateName[.]
bat <- c("Rhinolophus","bat","Hipposideros","Rousettus")
bat_id <- bat %>% paste(.,collapse="|") %>% grep(.,isolateName) %>% isolateName[.]
all_index <- c(1:length(isolateName))
human_id <- isolateName[!isolateName %in% c(mers_id,pangolin_id,bat_id)]
humanSample_id <- human_id %>% sample(.,10)

#build the sample matrix, and then transfer the matrix into dataframe
m <- distS[c(humanSample_id,bat_id,pangolin_id,mers_id),c(humanSample_id,bat_id,pangolin_id,mers_id)]
mName <- rownames(m)
df <- expand.grid(X=mName, Y=mName) #stringsAsFactors=FALSE
whichGroup <- function(x) {
  if (x %in% humanSample_id) {
    return("human")
  } else if(x %in% mers_id) {
    return("mers")
  } else if(x %in% bat_id) {
    return("bat")
  } else if(x %in% pangolin_id) {
    return("pangolin")
  }
}
for(i in 1:nrow(df)) {                        
  df[i,3] <-  m[df[i,1],df[i,2]]
  df[i,4] <- whichGroup(df[i,1])
  df[i,5] <- whichGroup(df[i,2])
}
names(df) <- c("X","Y","dist","xgroup","ygroup")

#plot the heatmap using ggplot2
df$xgroup <- factor(df$xgroup,levels = c("human","bat","pangolin","mers"))
df$ygroup <- factor(df$ygroup,levels = c("mers","pangolin","bat","human"))

df %>% ggplot(., aes(X, Y, fill= dist)) + 
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = mean(df$dist)) + 
  theme(axis.title.x=element_blank(), axis.text.x=element_blank(),axis.ticks.x=element_blank()) +
  facet_grid(ygroup ~ xgroup, scales = "free", space = "free") #coord_equal() +
ggsave("heatmapS.pdf",plot = last_plot(),device = "pdf",path = width = 15,height = 9)

