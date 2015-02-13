.. _daythree:

Align sequences with Bowtie and FastQC for alignment quality assessment
=======================================================================

Today we will be covering two things:

#. :ref:`bowtie`

#. :ref:`dthreefqc`

.. _bowtie:

Bowtie
------

Before we can align the trimmed sequences that we did yesterday, we need to first upload that file to the HPCC. Please use FileZilla and begin uploading that file to the **RNAseq** folder on the HPCC. If you aren't sure how to do that, refer back to :doc:`daytwo`.

**What is Bowtie?**

"Bowtie is an ultrafast, memory-efficient short read aligner geared toward quickly aligning large sets of short DNA sequences (reads) to large genomes... Bowtie indexes the genome with a `Burrows-Wheeler <http://en.wikipedia.org/wiki/Burrows%E2%80%93Wheeler_transform>`_ index to keep its memory footprint small..."

**What isn't Bowtie?**

"Bowtie is not a general-purpose alignment tool like MUMer, BLAST, or Vmatch. Bowtie works best when aligning short reads to large genomes, though it supports arbitrarily small reference sequences (e.g. amplicons) and reads as long as 1024 bases. Bowtie is designed to be extremely fast for sets of short reads where (a) many of the reads have at least one good, valid alignment, (b) many of the reads are relatively high-quality, and (c) the number of alignments reported per read is small (close to 1)."

*From: http://bowtie-bio.sourceforge.net/manual.shtml#what-is-bowtie*

In order for Bowtie to work, we need to provide it with trimmed reads files and the reference genome in a FASTA format file. This type of file typically ends in .fa or .fasta. 

We can acquire our favorite reference genome and feature file (GTF) from the `Ensembl website <http://bacteria.ensembl.org/info/website/ftp/index.html>`_.

So for our purposes, we will download the *L. reuteri* JCM1112 :download:`genome file <trimmedlreuterijcm1112.fa>` and :download:`feature file <alignlreuterijcm1112.gtf>`. The feature file contains data to inform HTSeq where the start and end of a gene is. This is important as HTSeq produces the number of transcripts per gene identified in a given sample. For now, please download these two files, upload them onto the HPCC, and into the RNAseq folder you generated earlier. If you have questions or issues, please place a red sticky note on your computer and I will come and help you.

We also need to do a little script editing to make sure that the HPCC and Bowtie do what we want them to do. So please download the :download:`Bowtie qsub file <trimmedbowtie.qsub>` and open it in a text editor (e.g. TextEdit or Notepad; **not Microsoft Word**).


The document will look something like this (take a minute and read through it and see if you understand what is going on):

.. literalinclude:: trimmedbowtie.qsub

The part that you will want to change is the line that **starts with the word "time"**. In this line, we are doing several things:

#. We are initiating Bowtie with the command **bowtie**

#. We are asking Bowtie to output the alignment results as *.sam* files by raising the **-S** flag

#. We are telling Bowtie to use 8 processors by raising the **-p** flag and specifying the number **7**

#. We are telling Bowtie to use the *indexed genome* that was built earlier in the code by specifying **trimmedlreuterijcm1112**

#. The input is specified by giving the **trimmedLRWT1.fastq**

#. We are telling Bowtie to output the data with the **>** and write it to a file called **alignLRWT1.sam**

You will need to change the filenames as identified in **5** and **6** to your appropriate sample file name. Once this is done, save the file and then upload it and the genome file (**trimmedlreuterijcm1112.fa**) to the **RNAseq** folder on the HPCC using FileZilla.

Once you have completed this task, please place a green sticky note on your computer. If you are having any issues, please put a red sticky note on your computer and I will come help you.

**Submitting the job to the HPCC**

Now we will use the job submission script you just edited to submit the Bowtie job.

#. Log in to the HPCC (if you aren't sure how to do this, refer to :doc:`daytwo`.)

#. Load the *powertools* module (if you aren't sure how to do this, refer back to the commands listed in :doc:`daytwo`.)

#. Log in to the intel10 compute node by typing: **intel10** and then hit Enter/Return

#. Submit the job by navigating to your RNAseq folder and then typing: **qsub trimmedbowtie.qsub** and then hit Enter/Return

.. note:: **BEFORE** you submit the job, make sure you are 1) in the RNAseq folder and 2) the sequence file, the .qsub file, and genome (.fa) file are all there.

.. note:: To check the status of your job, simply type: **sj** (short for "show job") and hit Enter/Return. This command is *only* possible though if you have the **powertools** module loaded.

**Questions!**

.. _dthreefqc:

FastQC
------

While Bowtie is running, let's open up FastQC and have a look again at what `good Illumina data <http://www.bioinformatics.babraham.ac.uk/projects/fastqc/good_sequence_short_fastqc.html>`_ and `bad Illumina data <http://www.bioinformatics.babraham.ac.uk/projects/fastqc/bad_sequence_fastqc.html>`_ look like. This will help us determine the quality of our own sequence based on their examples.

Now, let's look at the `FastQC documentation <http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/>`_ to see how to run our samples. In general, you go to **File** -> **Open** -> **Your .sam output from Bowtie**. 

Everyone, have a look at the status at their Bowtie submission and see if it is in the queue/running/completed. If your job is running or completed, place a green sticky note on their computer. If not, place a red sticky note on their computer.

If your job has completed, please use FileZilla to download the *.sam* file to your desktop. Once this is done, please take your green sticky not *off* your computer.

.. note:: If you are running out of room on your computer with the sequence data, upload the raw (untrimmed data) to the HPCC. Now, both the raw and trimmed data are off your computer and on the HPCC, allowing you to delete both of these files from your computer.

Once your *.sam* file has downloaded to your desktop, please start the FastQC analysis. This will take a few minutes and you should see some output stating that it is analyzing an increasing number of reads. Once it is done, have a look over the report and then find your other classmates who analyzed the same treatment group. To identify yourself, write the treatment name on your green sticky note and place it on your computer. Get together and compare reports.

**Presentation time!**

Please have one person from each treatment group come and present a *representative* report from each treatment, assessing the results.

.. note:: Save your report so that we can compile them at the end of the module.