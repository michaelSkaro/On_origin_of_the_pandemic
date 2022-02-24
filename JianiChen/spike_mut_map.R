## Spike protein mutation histogram
library(dplyr)
S_mut<-read.csv("human_CoV/human_gisaid_clean_astr/S_protein_fasta_mutation_list.csv")
S_mut_count<-S_mut %>%
  count(location) %>%
  mutate(percen=n/5209)

x = runif(1000,0,1255)

hist(S_mut_loc,freq=F, main="non-synonymous mutation of SARS-CoV2 spike protein till April,2020",
     xlab="Spike protein location")
#calculate density

d=density(S_mut_loc)

lines(d,col='blue',lwd=2)



S_mut_type<-read.csv("human_CoV/human_gisaid_clean_astr/S_protein_fasta_mutation.csv")
S_mut_loc<-S_mut_type$location