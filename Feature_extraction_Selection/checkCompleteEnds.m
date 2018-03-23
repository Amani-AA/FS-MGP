function [IncomplLabel complete]=checkCompleteEnds(orfSeq)

complete=zeros(1,2);
complete(1,1)=isStart(orfSeq(1:3)); 
complete(1,2)=isStop(orfSeq(end-2:end)); 

IncomplLabel= complete(1,1)==0 | complete(1,2)==0;


end 