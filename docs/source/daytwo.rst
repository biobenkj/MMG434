.. _daytwo:

RNA-seq background information, basic Linux/Unix commands, and Bowtie primer
============================================================================

Before we really dig into the data and begin trimming and aligning the reads to the genome, I think it is useful to understand what happens *after you submit your RNA to the sequencing facility*. This sort of knowledge can be very useful in understanding what could potentially provide bias and any number of issues to the end dataset. In this session we will cover several things including: 

#. :ref:`rnaseqbackground`

#. :ref:`basic-unix-coms`

#. :ref:`bowtieprimer`

.. _rnaseqbackground:

RNA-seq background information
------------------------------

Text

.. _basic-unix-coms:

Basic Linux/Unix commands
-------------------------

To refresh your memory on some basic Linux/Unix commands, we will cover the basic commands necessary to:

**1.** Move through folders

**2.** List the contents of a folder

**3.** Make new folders

**4.** Rename files/folders

**5.** Delete files/folders

**6.** Load modules on the MSU HPCC

.. csv-table::
   :header: " ", "Command", "What it does...", "Examples"
   :widths: 2, 8, 10, 40

   "**1.**", "cd", "Change directory/folder", "**>** cd ~ (this changes to your home directory); **>** cd .. (this goes back one folder)"
   "**2.**", "ls", "List the contents of a folder", "**>** ls"
   "**3.**", "mkdir", "Make a new directory/folder", "**>** mkdir NewFolder (this will make a new folder called 'NewFolder' in your current directory)"
   "**4.**", "mv", "Rename or move a file from one name to another", "**>** mv file1 file2 (this will rename/move file1 to file2)"  
   "**5.**", "rm", "Remove a file (add the -r flag to remove a folder)", "**>** rm file1 (remove file1); **>** rm -r folder1 (remove folder1)" 
   "**6.**", "module load", "Load a module on the MSU HPCC", "**>** module load Bowtie (loads the most recent version of Bowtie on the HPCC)"

**Command reference sheet**

.. image:: linuxcoms.jpg
	:align: center
	:alt: Linux/Unix command list
	
*from: http://files.fosswire.com/2007/08/fwunixref.pdf*


**Logging into the MSU HPCC for Mac**

**1.** Open the terminal by going to Finder -> Applications -> Utilities -> Terminal (might just be worth dragging it onto your dock).

.. image:: mactermnav.jpg
	:align: center
	:alt: Navigate to terminal on a Mac

.. _bowtieprimer:

Bowtie primer
-------------

Text