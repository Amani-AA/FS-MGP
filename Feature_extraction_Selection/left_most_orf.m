function left_most_orf(m,ia,orf_seq,frag_seq)
% 22  March 2018
% Amani Abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
final_set=zeros(1,5);
indices=zeros(1,1);


orf_set=m(:,2); % contain orf-set number
for i=1:length(ia) % length unique frags
    
  first=ia(i);
  if(i==length(ia))
      last=length(orf_set);
  else
       last=ia(i+1)-1;
  end% if
  x=orf_set(first:last);

  [c2,ai2,ic2]=unique(x,'stable','rows');

  % add to matrix in sperate function
  new_add=m(ai2+(first-1),:);
 
 
  if (i==1)
     final_set=new_add;
     indices= ai2+(first-1);
  else
    indices= [indices ; ai2+(first-1)];
    final_set=[final_set;new_add];% use to print in output_file
  end% if
  
end%for

   frags_num=m(indices,1);
 % this stage add sequence to martix 
  add_sequences(indices,frags_num,orf_seq,frag_seq);
 
  %%%%%%%%%%%% Combine Results%%%%%%%%%%%
  
 pre_m=m(indices,:);
 save('prediction_matrix','pre_m','-v7.3')
end% function
 