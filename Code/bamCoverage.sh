#!/bin/bash

bamCoverage -b [bam file] \
	-o [out bigwig file] \
	-of [out format, bigwig by default] \
	--binSize [int, the bin size] \
	-p [int, the number of processers] \
	--normalizeUsing [normalize method, RPKM etc.] \
	--extendReads [set to extend the reads length to fragment size]

#more information about bamCoverage: bamCoverage --help
