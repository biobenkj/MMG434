#!/bin/bash

#Load the trimmomatic and fastQC module
module load trimmomatic
module load fastqc

#Change to the QC directory
cd ~/RNAseq/QC

#Do the trimming!
java -jar $TRIM/trimmomatic SE -threads 4 ~/RNAseq/Data/gly7a.fq.gz ~/RNAseq/QC/trimmedgly7a.fq.gz ILLUMINACLIP:$TRIM/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 
java -jar $TRIM/trimmomatic SE -threads 4 ~/RNAseq/Data/gly7b.fq.gz ~/RNAseq/QC/trimmedgly7b.fq.gz ILLUMINACLIP:$TRIM/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar $TRIM/trimmomatic SE -threads 4 ~/RNAseq/Data/gly5a.fq.gz ~/RNAseq/QC/trimmedgly5a.fq.gz ILLUMINACLIP:$TRIM/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar $TRIM/trimmomatic SE -threads 4 ~/RNAseq/Data/gly5b.fq.gz ~/RNAseq/QC/trimmedgly5b.fq.gz ILLUMINACLIP:$TRIM/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar $TRIM/trimmomatic SE -threads 4 ~/RNAseq/Data/pyr7a.fq.gz ~/RNAseq/QC/trimmedpyr7a.fq.gz ILLUMINACLIP:$TRIM/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar $TRIM/trimmomatic SE -threads 4 ~/RNAseq/Data/pyr7b.fq.gz ~/RNAseq/QC/trimmedpyr7b.fq.gz ILLUMINACLIP:$TRIM/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar $TRIM/trimmomatic SE -threads 4 ~/RNAseq/Data/pyr5a.fq.gz ~/RNAseq/QC/trimmedpyr5a.fq.gz ILLUMINACLIP:$TRIM/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar $TRIM/trimmomatic SE -threads 4 ~/RNAseq/Data/pyr5b.fq.gz ~/RNAseq/QC/trimmedpyr5b.fq.gz ILLUMINACLIP:$TRIM/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36


#Analyze the reads pre-alignment with FastQC
fastqc trimmedgly7a.fq.gz
fastqc trimmedgly7b.fq.gz
fastqc trimmedgly5a.fq.gz
fastqc trimmedgly5b.fq.gz
fastqc trimmedpyr7a.fq.gz
fastqc trimmedpyr7b.fq.gz
fastqc trimmedpyr5a.fq.gz
fastqc trimmedpyr5b.fq.gz