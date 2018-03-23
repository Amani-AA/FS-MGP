function main(orf_coord,orf_seq,frag_seq)
% 22  March 2018
% Amani Abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018

% The main program will take orf_coord, orf_seq, frag_seq as input and produce Test_orfSeqs.csv as output. 
% It calls two functions:


% 1. read_orphelia_file.m that will pick the leftmost ORFs from each ORF-set.
read_orphelia_file(orf_coord,orf_seq,frag_seq);

% 2. orf_feature_extraction_selection.m that will perform feature extraction and feature selection.
orf_feature_extraction_selection();

end%function