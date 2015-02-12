.. _daythree:

Align sequences with Bowtie and FastQC primer for alignment quality assessment
==============================================================================

.. _bowtie:

Bowtie
------

**What is Bowtie?**

"Bowtie is an ultrafast, memory-efficient short read aligner geared toward quickly aligning large sets of short DNA sequences (reads) to large genomes... Bowtie indexes the genome with a `Burrows-Wheeler <http://en.wikipedia.org/wiki/Burrows%E2%80%93Wheeler_transform>`_ index to keep its memory footprint small..."

**What isn't Bowtie?**

"Bowtie is not a general-purpose alignment tool like MUMer, BLAST, or Vmatch. Bowtie works best when aligning short reads to large genomes, though it supports arbitrarily small reference sequences (e.g. amplicons) and reads as long as 1024 bases. Bowtie is designed to be extremely fast for sets of short reads where (a) many of the reads have at least one good, valid alignment, (b) many of the reads are relatively high-quality, and (c) the number of alignments reported per read is small (close to 1)."

*From: http://bowtie-bio.sourceforge.net/manual.shtml#what-is-bowtie*

In order for Bowtie to work, we need to provide it with trimmed reads files and the reference genome in a FASTA format file. This type of file typically ends in .fa or .fasta. 

We can acquire our favorite reference genome and feature file from the `Ensembl website <http://bacteria.ensembl.org/info/website/ftp/index.html>`_.

So for our purposes, we will download the *L. reuteri* JCM1112 :download:`genome file <lreuterijcm1112.fa>` and :download:`feature file <lreuterijcm1112.gtf>`. The feature file contains data to inform HTSeq where the start and end of a gene is. This is important as HTSeq produces the number of transcripts per gene identified in a given sample. For now, please download these two files, upload them onto the HPCC, and into the RNAseq folder you generated earlier. If you have questions or issues, please place a red sticky note on your computer and I will come and help you.


