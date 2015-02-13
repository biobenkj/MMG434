.. _dayfour:

Counting gene features with HTSeq
=================================

This step will take the longest time, computationally, out of the entire workflow. 

`HTSeq <http://www-huber.embl.de/users/anders/HTSeq/doc/overview.html>`_ is a powerful Python package for analyzing NGS data. For our purposes, we will be using the counting feature of HTSeq. Let's have a look at the way HTSeq can `count whether a read maps to a gene <http://www-huber.embl.de/users/anders/HTSeq/doc/count.html#count>`_.

We need to supply htseq-count with a couple things:

#. A genome feature file (GTF) so that HTSeq "knows" where the start and end of a gene is

#. The *.sam* file that was output from Bowtie

To use htseq-count on the HPCC, we have to edit :download:`another job submission script <alignhtseq.qsub>`, which will look something like this:

.. literalinclude:: alignhtseq.qsub

Thus, please download and open it in a text editor (e.g. TextEdit or Notepad; **not Microsoft Word**).

The part that you will want to change is the line that **starts with the word "htseq-count"**. In this line, we are doing several things:

#. We are calling **htseq-count**

#. Specifying which mode we want to use for HTSeq to count a read mapping to a gene with the **-m intersection-nonempty**

#. Stating that the information it can expect is the reverse strand information with **--stranded=reverse** (this comes from the kit used to prepare the libraries)

#. Providing the *.sam* input (please change this file name to your appropriate sample name)

#. Providing the **GTF** file

#. We are telling HTSeq to output the data with the **>** and write it to a file called **LRWT1map.sam** (please change this output file name to your appropriate sample name and making sure it ends in *map.sam* like the example)

**Submitting the job to the HPCC**

Now we will use the job submission script you just edited to submit the HTSeq job.

#. Log in to the HPCC (if you aren't sure how to do this, refer to :doc:`daytwo`.)

#. Load the *powertools* module (if you aren't sure how to do this, refer back to the commands listed in :doc:`daytwo`.)

#. Log in to the intel10 compute node by typing: **intel10** and then hit Enter/Return

#. Edit the name of the folder that your Bowtie job put all the output in to **Bowtie** (e.g. Type: mv BowtieJobOutputLongListOfNumbers Bowtie) - tab auto-complete helps here :)

#. Submit the job by navigating to your RNAseq folder and then the Bowtie folder you just renamed and typing: **qsub alignhtseq.qsub** and then hit Enter/Return

.. note:: **BEFORE** you submit the job, make sure you are 1) in the Bowtie folder and 2) the *.sam* file, the .qsub file, and feature file (.gtf) file are all there.

.. note:: To check the status of your job, simply type: **sj** (short for "show job") and hit Enter/Return. This command is *only* possible though if you have the **powertools** module loaded.

**Questions! We have about an hour for this to run, so now might be a good time to start writing up your report on the progress you've made so far.**