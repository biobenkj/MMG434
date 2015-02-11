.. _dayone:

Install software and make sure everyone is on the same page
===========================================================

Before moving forward to mapping reads to the genome, it is necessary to QC the reads and remove low quality reads and adapter sequences. Further we need the ability to perform differential gene expression between conditions. We have chosen to do this through several software packages. Below are some instructions on how to install them.

Software to install:
--------------------

#. :ref:`trimmomatic`

#. :ref:`fastqc`

#. :ref:`r`

#. :ref:`rstudio`


.. _trimmomatic:

Trimmomatic
-----------

Trimmomatic is a commonly utilized tool for QC/trimming short reads and has been implemented in RNA-seq approaches in the literature and is the go to tool at the MSU sequencing facility (RTSF).

1. Trimmomatic can be downloaded from `here <http://www.usadellab.org/cms/index.php?page=trimmomatic>`_.

2. Scroll down the page (which you can read at your leisure later if you are interested) to where it says "Download Trimmomatic"

3. Click on the link that says "binary"

.. image:: trimbinary.jpg
	:width: 400px
	:align: center
	:height: 300px
	:alt: image showing area where to download the binary file for Trimmomatic
	
4. The file will end up in your downloads folder and will likely need to be unzipped as it is compressed. This can typically be accomplished just by double clicking on the file itself in your downloads folder.

5. Once this is done, move the folder to your desktop.

.. note:: Trimmomatic runs on Java. Go `here <http://www.java.com/en/>`_ and click on "Download" and download/install the latest version of Java for your computer. **Trimmomatic will not run unless you have Java installed**.

6. Open the Trimmomatic folder on your desktop and navigate to the folder called **adapters**.

7. Drag and drop the file **TruSeq3-SE.fa** out of the adapters subfolder and into the main **Trimmomatic** folder. The list of files in the main folder will like be: an adapters folder, LICENSE, trimmomatic-0.32.jar, and TruSeq3-SE.fa.

8. You should be all set for installing this software!

.. _fastqc:

FastQC
------

FastQC is an application that can be utilized to assess sequence data. It's worth looking at the reads after trimming/before aligning to the genome and after aligning to the genome.

1. FastQC can be downloaded `here <http://www.bioinformatics.babraham.ac.uk/projects/fastqc/>`_.

.. image:: fastqc.jpg
	:width: 500px
	:align: center
	:height: 250px
	:alt: image showing area where to download FastQC
	
.. image:: fastqcfiledownload.jpg
	:width: 500px
	:align: center
	:height: 250px
	:alt: image showing area where to download either Windows or Mac FastQC files

2. The software is well documented and quite powerful. Every statistic/assessment that it draws can be found in the `FastQC documentation <http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/>`_. Further, you can watch a `tutorial video <https://www.youtube.com/watch?v=bz93ReOv87Y>`_ and view examples of `good Illumina data <http://www.bioinformatics.babraham.ac.uk/projects/fastqc/good_sequence_short_fastqc.html>`_ and `bad Illumina data <http://www.bioinformatics.babraham.ac.uk/projects/fastqc/bad_sequence_fastqc.html>`_.

3. The file will end up in your downloads folder. If you are a **Windows user**, double click on the **run_fastqc bat file**. If you are a **Mac** user, double click on the **fastqc_vX.XX.X.dmg file** to run the application.

.. note:: FastQC runs on Java. Go `here <http://www.java.com/en/>`_ and click on "Download" and download/install the latest version of Java for your computer. **FastQC will not run unless you have Java installed**.

4. Please attempt to open the software to make sure that everything will at least open and run.

5. Congratulations! You've installed another piece of software for this module.

.. _r:

R
-

Text


.. _rstudio:

RStudio
-------

Text