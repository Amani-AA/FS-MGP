function out=isStart(codon)

Starts={'ATG'  'CTG'  'GTG' 'TTG'};
out=sum(strcmp(Starts,char(codon)));
end