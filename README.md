# FS-MGP
Feature selection for Gene prediction in metagenomic fragments

Datasets:
datasets for training and testing are available in the Orphelia  website http://orphelia.gobics.de/datasets.jsp 

Open reading frame (ORF) extraction:
We use Orphelia- a metagenomic ORF finding tool- to extract ORFs from each fragment. Then, we pick left-most ORFs from each ORF-set to further analysis.

Feature extraction and feature selection:
orf_feature_extraction_selection.m is the main program for feature extraction and feature selection. The input is the list of left-most ORFs sequences with gc content and the output is a matrix of size (the number of ORFS by 503 features).





