function diCodons3 = diCodon(seq)
% 22  March 2018
% Amani Abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018

keySet ={'AAA','AAC','AAG','AAT','ACA','ACC','ACG','ACT','AGA','AGC','AGG','AGT','ATA','ATC','ATG','ATT','CAA','CAC','CAG','CAT','CCA','CCC','CCG','CCT','CGA','CGC','CGG','CGT','CTA','CTC','CTG','CTT','GAA','GAC','GAG','GAT','GCA','GCC','GCG','GCT','GGA','GGC','GGG','GGT','GTA','GTC','GTG','GTT','TAA','TAC','TAG','TAT','TCA','TCC','TCG','TCT','TGA','TGC','TGG','TGT','TTA','TTC','TTG','TTT'};
valueSet = [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64];
mapObj = containers.Map(keySet,valueSet);

diCodons=zeros(64,64);


if ~ischar(seq)
        seq = char(seq);
    end

len= length(seq);
for i= 1:3:len 
    
    if ( i+2 )<len
    given_codon1=seq(i:i+2);
    s = nt2int(given_codon1);
    if sum( s>4 & s<16)== 0 && sum( s==16)==0
     
       if (i+3)< len & (i+5)<=len
          given_codon2=seq(i+3:i+5);
          s2 = nt2int(given_codon2);
          if sum( s2>4 &  s2<16)== 0 && sum( s2==16)==0  
             
              k=  mapObj(given_codon1);
              j=mapObj(given_codon2);
              diCodons(k,j)=diCodons(k,j)+1;
          end%if (4)
       end%if  (3)
    end%if (2)
    end%if (1)

end%for

diCodons2=reshape(diCodons,1,4096); 
diCodons3 = diCodons2 ./sum(diCodons2);

% remove 192 index 
load('list_index.mat'); 
index=ind;
diCodons3(index)=[];

end
