# OrthoFinder version 2.5.5
# diamond version 2.1.21
orthofinder -f ./ -t 16 -M msa -S diamond -A mafft -T fasttree

# MSA by mafft version 7.526
mkdir aln
for i in *.fa
do
    echo "Aligning $i" | tee -a mafft.log
    mafft --auto "$i" > aln/"${i%.fa}.aln.fa" 2>> mafft.log
done

# Trim by trimAl v1.5.rev1 build
mkdir trimmed_aln
for i in *.aln.fa
do
    echo "Trimming $i ..."
    trimal -in "$i" -out trimmed_aln/"${i%.aln.fa}.trim.fa" -automated1
done

# trimmed_rename
bash sed.sh

# Sequence Concatenation
# by using https://github.com/marekborowiec/AMAS
python3 AMAS.py concat \
    -i *.trim.fa \
    -f fasta \
    -d aa \
    -t supermatrix.phy

# IQ-TREE version 3.0.1
# https://iqtree.github.io/doc/Substitution-Models
# The new modelfinder (-m MFP) which can automatically best-fit model for the data
iqtree -s supermatrix.phy -m MFP -bb 1000 -nt
