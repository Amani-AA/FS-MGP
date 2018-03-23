function diAAs = diAA(seq)

if ~iscell(seq)
    if ~ischar(seq)
        seq = char(seq);
    end
    seq=nt2aa(seq, 'ACGTOnly',false,'AlternativeStartCodons',false);
   
    diAAs = nmercount(seq,2);
    diAAs = diAAcell2diAAvect(diAAs);
    diAAs = diAAs ./sum(diAAs);
else
    diAAs = zeros(length(seq),441);
    for i=1:length(seq)
        if ~ischar(seq{i})
            s = char(seq{i});
        else
            s = seq{i};
        end
        s=nt2aa(s, 'ACGTOnly',false,'AlternativeStartCodons',false);
        diAA = nmercount(s,2);
        diAA = diAAcell2diAAvect(diAA);
        diAA = diAA ./sum(diAA);
        diAAs(i,:) = diAA;
    end
end

function diAAVect = diAAcell2diAAvect(di)  %convert structure to vector
diAAVect=zeros(1,441); 

for i=1:length(di)
    
    aa = aa2int(di{i,1}); 
    if sum(aa>20 & aa<24)== 0 && sum(aa==25)==0 
        aa(aa==24)=21; %
        diAAVect(sub2ind([21 21], aa(1), aa(2))) = di{i,2};
    end
end