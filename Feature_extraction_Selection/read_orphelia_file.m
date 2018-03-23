function read_orphelia_file(orf_coord,orf_seq,frag_seq)

% 22  March 2018
% Amani Abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018

% The program  will read orphelia input files and pick the leftmost ORFs from each ORF-set. 


fileID = fopen(orf_coord);


C = textscan(fileID, '%c %d %c %d %c %d %c %d %c %c');
fclose(fileID);
x=length(C{2}); % number of rows in the file
%covert from cell to regular matrix
m=zeros(x,5);  
m(:,1)=C{2}; % frag number
m(:,2)=C{4}; % orf-set number
m(:,3)=C{6}; % orf start
m(:,4)=C{8}; % orf end
m(:,5)=C{10}; % strand

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

frags1=m(:,1);
[frags, ia, ic] = unique(frags1,'stable','rows');


left_most_orf(m,ia,orf_seq,frag_seq );

end%function