function m=post(test_file)

% 22  March 2018
% Amani Abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018

fileID = fopen(test_file);
C = textscan(fileID, '%f');
fclose(fileID);
x=length(C{1}); % number of rows in the file
%convert from cell to regular matrix
m=zeros(x,1);  
m(:,1)=C{1}; % frag number

end%function