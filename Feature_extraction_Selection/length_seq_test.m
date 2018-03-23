function x=length_seq_test(seq)

% 22  March 2018
% Amani Abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018
   
x=zeros(1,2);

l=checkCompleteEnds(seq);
len=length(seq);

    if l==1  %incomplete 
       x(1)=0;  % length complete 
       x(2)=len/700; %length incomplete
        
    else % complete
        x(1)=len/700; % length complete 
        x(2)=0;       %length incomplete
        
    end%if
    

end%function