.. _daythree:

Align sequences with Bowtie and count gene features with HTSeq
==============================================================

Today we will be covering two things:

#. :ref:`bowtie`

#. :ref:`dthtseq`


.. _bowtie:

Bowtie
------

Before we can align the trimmed sequences that we did yesterday, we need to first decompress the trimmed files in the QC folder on the HPCC. Please log onto the HPCC and copy and paste these commands into your terminal and hit Enter/Return (if you don't remember how to copy and paste, refer back to :doc:`daytwomod`::

    module load powertools
    intel14
    bash /mnt/research/mmg434/RNAseqScripts/decompressfastq.sh
    ls ~/RNAseq/QC
    
These commands decompress the .gz trimmed files to .fastq files. Bowtie expects .fastq files for input.

**What is Bowtie?**

"Bowtie is an ultrafast, memory-efficient short read aligner geared toward quickly aligning large sets of short DNA sequences (reads) to large genomes... Bowtie indexes the genome with a `Burrows-Wheeler <http://en.wikipedia.org/wiki/Burrows%E2%80%93Wheeler_transform>`_ index to keep its memory footprint small..."

**What isn't Bowtie?**

"Bowtie is not a general-purpose alignment tool like MUMer, BLAST, or Vmatch. Bowtie works best when aligning short reads to large genomes, though it supports arbitrarily small reference sequences (e.g. amplicons) and reads as long as 1024 bases. Bowtie is designed to be extremely fast for sets of short reads where (a) many of the reads have at least one good, valid alignment, (b) many of the reads are relatively high-quality, and (c) the number of alignments reported per read is small (close to 1)."

*From: http://bowtie-bio.sourceforge.net/manual.shtml#what-is-bowtie*

In order for Bowtie to work, we need to provide it with trimmed reads files and the reference genome in a FASTA format file. This type of file typically ends in .fa or .fasta. 

We can acquire our favorite reference genome and feature file (GTF) from the `Ensembl website <http://bacteria.ensembl.org/info/website/ftp/index.html>`_.

Once we get our data from the RTSF, we will download the *L. reuteri* JCM1112 :download:`genome file <trimmedlreuterijcm1112.fa>` and :download:`feature file <alignlreuterijcm1112.gtf>`. The feature file contains data to inform HTSeq where the start and end of a gene is. This is important as HTSeq produces the number of transcripts per gene identified in a given sample. For now, we will just grab these two files from the /mnt/research/mmg434/ExampleRNAseqData directory.

To run Bowtie, we have to do a couple things. First, we need to build the index from the reference genome (trimmedMtbCDC1551.fa). To do that, copy and paste these commands into your terminal and hit Enter/Return::

    cd ~/RNAseq/Bowtie
    bowtie-build /mnt/research/mmg434/ExampleRNAseqData/trimmedMtbCDC1551.fa trimmedCDC1551
    
So let's break down what we just did:

#. cd ~/RNAseq/Bowtie - Changing to the Bowtie subfolder inside of the RNAseq folder.

#. bowtie-build /mnt/research/mmg434/ExampleRNAseqData/trimmedMtbCDC1551.fa trimmedCDC1551 - Calling Bowtie to build an index called trimmedCDC1551 from the reference (trimmedMtbCDC1551.fa) found in the /mnt/research/mmg434/ExampleRNAseqData folder.
    
Now that we have built the index, we can ask Bowtie to do the alignment on the first file for us! Copy and paste these commands into your terminal and hit Enter/Return::

    cd ~/RNAseq/Bowtie
    bowtie -S trimmedCDC1551 ~/RNAseq/QC/trimmedgly7a.fastq > aligngly7a.sam
    
Let's break down what we just did:

#. cd ~/RNAseq/Bowtie - Changing to the Bowtie subfolder inside of the RNAseq folder.

#. bowtie -S - This calls Bowtie and asks the program to produce files with .sam output (this allows us to be able to interpret the alignment *somewhat*... It's still a lot to take in).

#. trimmedCDC1551 ~/RNAseq/QC/trimmedgly7a.fastq > aligngly7a.sam - Use the index we made called trimmedCDC1551 and take the reads from trimmedgly7a.fastq in the QC subfolder within the RNAseq folder, and write the alignment (using the '>' character) to the file aligngly7a.sam. 

.. note:: It is **very** important that you end the output file with *.sam*.

Now, work with a neighbor and see if you can change the above commands to align the trimmedgly7b.fastq file.

If you have problems, please put a red stick on your computer. If all is well, place a green sticky on your computer.

Bear in mind though, that we will have to do something *very* different when we go to analyze the full read set from the *L. reuteri* samples. We will do something like this (below).

The document will look something like this (take a minute and read through it):

.. literalinclude:: trimmedbowtie.qsub


**Questions!**

.. _dthtseq:

This step will take the longest time, computationally, out of the entire workflow. 

`HTSeq <http://www-huber.embl.de/users/anders/HTSeq/doc/overview.html>`_ is a powerful Python package for analyzing NGS data. For our purposes, we will be using the counting feature of HTSeq. Let's have a look at the way HTSeq can `count whether a read maps to a gene <http://www-huber.embl.de/users/anders/HTSeq/doc/count.html#count>`_.

We need to supply htseq-count with a couple things:

#. A genome feature file (GTF) so that HTSeq "knows" where the start and end of a gene is

#. The *.sam* file that was output from Bowtie

To do the counting, copy and paste these commands into your terminal and hit Enter/Return::

    module load htseq
    cd ~/RNAseq/HTSeq
    htseq-count -m intersection-nonempty --stranded=yes ~/RNAseq/Bowtie/aligngly7a.sam /mnt/research/mmg434/ExampleRNAseqData/alignMtbCDC1551.gtf > gly7amap.sam
    
You likely have an idea by now what the first two commands are doing, but let's talk briefly about the htseq-count command:

#. htseq-count - This is calling the counting functionality of HTSeq.

#. -m intersection-nonempty - This is telling HTSeq how we want to determine what is or is not a gene feature.

#. --stranded=yes - This is telling HTSeq whether or not our data has strand specific information.

#. ~/RNAseq/Bowtie/aligngly7a.sam /mnt/research/mmg434/ExampleRNAseqData/alignMtbCDC1551.gtf > gly7amap.sam - This is saying where the aligned sequence file is, where the genome feature file (.gtf) and write the counts to the file gly7amap.sam

.. note:: It is **very** important that you end the output file with *.sam*.

Work with a neighbor and see if you can perform the counting on the second file (aligngly7b.sam). If you have trouble, put up a red sticky. If all is fantastic, put up a green sticky.

To use htseq-count on the HPCC once we have the full read set from the *L. reuteri* samples, we will have to edit a job submission script, which will look something like this:

.. literalinclude:: alignhtseq.qsub

**Questions! Otherwise, that is all for now!**