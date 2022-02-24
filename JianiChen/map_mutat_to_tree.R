library(treeio)
library(ggplot2)
library(ggtree)
library(phytools)
library(ape)
library(RColorBrewer)
library(dplyr)

t<-read.tree(file="BetaCoV_aln_refnuc/final_aln/S_select_species.nwk")

p1<-ggtree(t)+ geom_treescale(x=0, y=185, width=0.5,,offset=3)
#p1 <- p1 %>% collapse(node=496)
mut_map<- read.table("BetaCoV_aln_refnuc/final_aln/S_species_mut_0926.csv",  sep=",", header=TRUE,check.names=FALSE, stringsAsFactor=F, fill=TRUE,row.names = 1)

species<-read.table("BetaCoV_aln_refnuc/final_aln/S_species_type.txt", sep="\t", header=TRUE,check.names=FALSE, stringsAsFactor=F, fill=TRUE)
p1<- p1 %<+% species +
  geom_tippoint(aes(color=type), size=3, alpha=.75)
gheatmap(p1,mut_map,offset = 0.018, width=1, font.size=3, colnames_position= "top", colnames_angle = 90, colnames_offset_y = 20,hjust = 1)+
  scale_fill_viridis_d(option="D", name="Amino acid")

## visulization2
## join table species and mutmap
mut<- read.table("BetaCoV_aln_refnuc/final_aln/S_species_mut_0926.csv",  sep=",", header=TRUE,check.names=FALSE, stringsAsFactor=F, fill=TRUE)
df<-merge(species,mut,by="taxa") %>%
  select(-"taxa")%>%
  distinct()
write.csv(df, "BetaCoV_aln_refnuc/final_aln/S_species_visulize_0926.csv")

df%>%
  filter(type =="Human COVID19")%>%
  lapply(unique)

df%>%
  filter(type =="Pangolin BetaCoV")%>%
  lapply(unique)

df%>%
  filter(type =="MERS")%>%
  lapply(unique)
