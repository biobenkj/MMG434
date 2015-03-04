.. _broken:

Modification to the scripts from today (3-4-15)!
================================================

Please copy and paste the appropriate commands into your terminal on the HPCC to fix my mistake. Sorry everyone!

If you are in the LB vs Indole group::

    cp /mnt/research/mmg434/LreuteriRNAseqData/LreuteriAnalysisScriptLBvsIndole.sh ~
    module load powertools
    intel14-phi
    qsub LreuteriAnalysisScriptLBvsIndole.sh
    
If you are in the LB vs Commensal group::

    cp /mnt/research/mmg434/LreuteriRNAseqData/LreuteriAnalysisScriptLBvsComm.sh ~
    module load powertools
    intel14-phi
    qsub LreuteriAnalysisScriptLBvsComm.sh
    
If you are in the LB vs EHEC group::

	cp /mnt/research/mmg434/LreuteriRNAseqData/LreuteriAnalysisScriptLBvsEHEC.sh ~
	module load powertools
	intel14-phi
	qsub LreuteriAnalysisScriptLBvsEHEC.sh
	
	
These will run now. Something weird happened when I uploaded the files to the HPCC.