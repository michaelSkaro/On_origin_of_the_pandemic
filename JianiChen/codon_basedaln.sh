#!/bin/bash
## perform a codon based alignment

input=$1
annotation=$2
protein_output="${annotation}.pep"

alignment_pep="${annotation}_al.pep"
alignment_nuc="${annotation}_al.fasta"
## 1. translate the input fasta to protein sequence with EMBOSS 

/Users/jianichen1/EMBOSS-6.6.0/emboss/transeq $input  $protein_output -sformat pearson

sed  -i.bak 's/_1$//' $protein_output
echo "nucleotides have been translated into proteins in the file $protein_output"
## 2.protein alignment with MAFFT (ignore character)
mafft --anysymbol $protein_output > $alignment_pep
echo "protein alignment has been finished!"
##codon based alignment with pal2nal
## 3. need to pay attention if stop codon in the protein alignment

/Users/jianichen1/Desktop/phylogenetic_software/pal2nal.v14/pal2nal.pl $alignment_pep $input -output fasta > $alignment_nuc

echo "nucleotide alignment were written in $alignment_nuc with a fasta format"