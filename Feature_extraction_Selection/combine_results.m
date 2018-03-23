function combine_results(test_file)

% 22  March 2018
% Amani Abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018


%The program will take test.txt file that produced by test_SVM.R as input and will produce the final prediction
%in output_file.txt file
 


load('prediction_matrix')
output= zeros(1,4);
j=1;

%1. loading prediction matrix come from left_most_orf
for i=1:length(pre_m)
      output(j,1)=pre_m(i,1);
      output(j,2:3)=pre_m(i,3:4);
      output(j,4)=char(pre_m(i,5)); 
      j=j+1;

end%%for

% 2, call finalGeneSelection to solve overlap and get final results of prediction
p=post(test_file);
classout=finalGeneSelection(p,output,60);


% copy final gene list
final_output= zeros(1,4);
j=1;
for i=1:length(classout)
    
  if classout(i)==1
      final_output(j,1)=pre_m(i,1);
      final_output(j,2)=pre_m(i,3);
      final_output(j,3)=pre_m(i,4);
      final_output(j,4)=char(pre_m(i,5));
      j=j+1;
  end% if

end%%for

%final_output
%print to output file 
temp=zeros(1,4);
fileID = fopen('output_file.txt','w');
final_output(end,1);
for k=0:final_output(end,1)
ind=find(final_output(:,1)==k);
temp=final_output(ind,:);
fprintf(fileID,'%s %d \n','> Fragment', k );
for z=1:length(ind)
fprintf(fileID,'\t%d\t%d\t%c\n',temp(z,2:4) );
end %for z
end%for k

fclose(fileID);
end %function
