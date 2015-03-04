.. _dayfourmod:

Analyzing *L. reuteri* data
===========================

We have our data! Hooray! Now, we can go through and analyze all of it, from Trimmomatic to HTSeq. We are only going to take it through HTSeq and then do the differential gene expression interactively on our own machines.
This is simply because it's nice to work with everything on our own machines because we will be generating plots and may have to iteratively do the differential gene expression analysis based on the results/plots.

To this point, we have worked with a small subset of example RNA-seq data (100,000 reads per sample). Now, we will be working with full datasets (~15 million reads per sample). Thus, we are going to submit the jobs to the MSU HPCC to run for the next 20 hours or so. 

Let's have a look at the raw data that we received from the MSU RTSF. We sequenced 24 samples but got 48 files back! Why did we get twice the data back? This is due to the limitations of the sequencer itself. The particular flowcell for our data has 2 lanes. Each lane generates around 150 million reads total and we want around 15 million reads per sample. Thus, 24 samples * 15 million reads = 360 million total reads. This is more than twice what a single lane can produce for us. Thus, we pooled all of our samples together and ran them on both lanes to achieve the desired read number.
So in order to work with this data, we need to combine the reads from both lanes together into a single file. However, to do this effectively, we need to decompress the files and then merge them.

If you are interested in what I did to get to this point, the commands are as follows in pseudocode.

**Decompress files:** gunzip -c file_I_want_to_decompress.fastq.gz > decompressed_file.fastq

**Merge files:** cat sample1_read_data_from_lane2.fastq >> sample1_read_data_from_lane1.fastq

**Recompress files:** gzip -c file_I_want_to_compress.fastq > compressed_file.fastq.gz

I have already done all of this for you and grouped the merged and recompressed data into folders corresponding to different treatment comparisons:

**LB vs Indole treated L. reuteri**

**LB vs Commensal E. coli conditioned medium treated L. reuteri**

**LB vs EHEC conditioned medium treated L. reuteri**

These folders are located in /mnt/research/mmg434/LreuteriRNAseqData/RawData

Dr. Viswanathan has put together a list of who is doing which comparisons. 

.. csv-table::
    :file: groups.csv

Now, since time is of the essence, I have written a script to do the analysis for us! Let's have a look at it:

.. literalinclude:: LreuteriAnalysisScript.sh

This is a lot to take in! All this script is doing is linking all of the steps together and analyzing the data in one fell swoop for us. But! We **NEED** to change one thing in the script, depending on the comparison we are making.

Let's grab the script file::

    cp /mnt/research/mmg434/LreuteriRNAseqData/LreuteriAnalysisScript.sh ~
    
Now, let's open it in the **nano** text editor::

    nano LreuteriAnalysisScript.sh
    
It will look something like the script above. You can't use your mouse here and **must** use your arrow keys to get around. Let's read through the beginning of the script and see what we need to change.

Now, we will move down through the script and change the name of the folder containing the appropriate comparison **(unless you happen to be in the LB vs Commensal E. coli conditioned medium treated group!)**.

To save the changes, hit Ctrl + o, followed by the Enter/Return key.

To exit nano, hit Ctrl + x

To run the script::

    module load powertools
    intel14-phi
    module load powertools
    cd ~
    qsub LreuteriAnalysisScript.sh
    
Hooray! The script has been submitted to the queue to run. Write down your job ID.