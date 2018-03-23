function add_sequences(indices,frags_num,orf_seq,frag_seq)
% 22  March 2018
% Amani Abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018

% load file sequences
f = fopen(orf_seq);  
C = textscan(f,'%s ','delimiter','\n');
fclose(f);

% to hold sequences
orfSeqs=cell(length(indices),1);


for i=1:length(indices)
      j=indices(i);
      st=C{1}{j};
      orfSeqs{i}=uint8(st);
     
end %for


% read frag_seq file to extract gc content
f2 = fopen(frag_seq);   
C2 = textscan(f2,'%s ','delimiter','\n');
fclose(f2);


gc=zeros(length(indices), 1);

for i=1:length(frags_num)
      j=frags_num(i)+1;
      st=C2{1}{j};
      gc(i)=GcContent(st);
end %for

save('left_orfSeqs.mat','orfSeqs','gc','-v7.3')

end %function