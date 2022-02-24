#! /bin/bash
## change phylip to fasta
cd "$(dirname "$0")"
gene=$1
tree="RAxML_bestTree.${gene}_al.fasta.reduced"
aa_fasta="${gene}_reduced_aa.fasta"
mkdir $gene 
phylip="${gene}_al.fasta.reduced"
echo "$phylip"
cat $phylip |awk '$0=">"$0'| tr ' ' '\n'  | awk 'NR > 1 { print }' >> temp.fasta

echo "phylip2fasta is done"
## use the treetime package to do ancestral reconstruction

treetime ancestral --aln temp.fasta --tree $tree --outdir $gene/ancestral_results
echo "Ancestal reconstrunction for $fasta is done"

## do ancestral reconstruction for amino acid
treetime ancestral --tree $tree --aln $aa_fasta --aa --outdir $gene/aa_ancestral_results

echo "Ancestal reconstrunction for $aa_fasta is done"

##Analyzing homoplasies and recurrent mutations
treetime homoplasy --aln temp.fasta --tree $tree -n 9000 >> $gene/mutation_sum.txt
echo "mutation have been summarized"

## for amino acid

treetime homoplasy --aln $aa_fasta --aa --tree $tree -n 9000 >> $gene/aa_mutation_sum.txt
echo "mutation for amino acid have been summarized"


rm temp.fasta

echo "$gene is all finished" 

