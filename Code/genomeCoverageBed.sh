#!/bin/bash

#official guide: https://bedtools.readthedocs.io/en/latest/content/tools/genomecov.html

#################################### -bg or -bga or -split #########################################
#          	=============               ============ <s> ================= <s> ============    #
#               	=====									   #
#                  	  =======								   #
#    -------------------------- above is input(bam for example) -------------------------------	   #
#[1]-d    	|1111111|2|3|1111|000000000|111111111111|111|11111111111111111|111|111111111111|   #
#[2]-bg   	|   1   |2|3| 1  |         |      1     | 1 |         1       | 1 |     1      |   #
#[3]-bga  	|   1   |2|3| 1  |    0    |      1     | 1 |         1       | 1 |     1      |   #
#[4]-d -split	|1111111|2|3|1111|000000000|111111111111|000|11111111111111111|000|111111111111|   #
#[5]-bga -split |   1   |2|3| 1  |    0    |      1     | 0 |         1       | 0 |     1      |   #
#												   #	
####################################################################################################

#the main difference of -bg, -bga and -split
#-bg	ignore the region with no reads cover (BUT INCLUDE SPLICE JUNCITION)
#-bga	report all region, include the region with no reads cover
#-split	treat splice junction as gap region (IMPORTANT FOR RNA-SEQ)

genomeCoverageBed -ibam [position sorted bam file] \
	-d <report the coverage at single base resolution> \
	-bg \
	-bga \
	-split \
	-strand <Calculate coverage of intervals from a specific strand> \
	-pc <Calculate coverage of pair-end fragments, only used for bam input> \
	-fs <Force to use provided fragment size instead of read length, only used for bam input> \
	-du <Change strand af the mate read (so both reads from the same strand) useful for strand specific, only used for bam input>

#trick
samtools sort -b <BAM> | genomeCoverageBed -ibam stdin
#or
samtools sort -b <BAM> | genomeCoverageBed -ibam -
