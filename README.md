# FS-MGP
Feature selection for Gene prediction in metagenomic fragments

Datasets: 
datasets for training and testing are available in the Orphelia website http://orphelia.gobics.de/datasets.jsp

Main programs:

1. Open reading frame (ORF) extraction: We use Orphelia- a metagenomic ORF finding tool- to extract ORFs from each fragment. The output files are: orf.coords, orf.seq, frags.seq

2. Feature extraction and feature selection: 
Execute  main program that will take orf_coord, orf_seq, frag_seq as input and produce   Test_orfSeqs.csv as output.  It calls two functions:
1. read_orphelia_file.m that will pick leftmost ORFs from each ORF-set.
2. orf_feature_extraction_selection.m that will perform feature extraction and feature selection.

3. Testing:
Execute test_SVM.R, that will take Test_orfSeqs.csv as input and will produce test.txt file as output.

4. Output:
call combine_results() that will take  test.txt file as input and will produce the final prediction
output_file.txt





