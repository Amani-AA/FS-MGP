function orf_feature_extraction_selection()

% 11  March 2018
% Amani abdullah
% Feature selection for Gene prediction in metagenomic fragments, 2018

%load('left_orfSeqs.mat')
load('left_orfSeqs_917.mat')
% the best 500 feature from mRMR algorithm for 10 GC ranges
f1=load('500Features_part1.mat')
f2=load('500Features_part2.mat')
f3=load('500Features_part3.mat')
f4=load('500Features_part4.mat')
f5=load('500Features_part5.mat')
f6=load('500Features_part6.mat')
f7=load('500Features_part7.mat')
f8=load('500Features_part8.mat')
f9=load('500Features_part9.mat')
f10=load('500Features_part10.mat')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


k=length(orfSeqs)
features_v1=zeros(1,4432);
features_part=zeros(1,503); 
all_features=zeros(k,503);

j1=0;
for i=1:k   
    % feature extraction
    seq=orfSeqs{i};
    features_v1(1,1:64)=monoCodon(seq); %monocodon
    features_v1(1,65:3968)=diCodon(seq);%dicodon
    features_v1(1,3969:3988)=monoAA(seq);%monoamino acid
    features_v1(1,3989:4429)=diAA(seq);%diamino acid
    features_v1(1,4430:4431)=length_seq_test(seq); % length complete & length incomplete
    features_v1(1,4432) =gc(i);    % Gc contents
    GcR=gc(i); % Gc Range
    
    % mRMR Feature selection to select 503 features 
    
    if GcR>=0  &  GcR<0.3657 %GC range 1
   
        features_part(1,1:500)=features_v1(1,f1.features); % extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431); % extract ORF length
        features_part(1,503)=features_v1(1,4432);          % extract GC content
        all_features(i,:)=features_part(1,1:503);          
        
        
    elseif GcR>=0.3657  &  GcR< 0.4157 %GC range 2
        features_part(1,1:500)=features_v1(1,f2.features); % extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431); % extract ORF length
        features_part(1,503)=features_v1(1,4432);          % extract GC content
        all_features(i,:)=features_part(1,1:503);
  
    elseif GcR>=0.4157  &  GcR< 0.46 % GC range 3
        features_part(1,1:500)=features_v1(1,f3.features);% extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431);% extract ORF length
        features_part(1,503)=features_v1(1,4432);         % extract GC content
        all_features(i,:)=features_part(1,1:503);
        
    elseif GcR>=0.46 &  GcR< 0.5014 % GC range 4
        features_part(1,1:500)=features_v1(1,f4.features); % extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431); % extract ORF length
        features_part(1,503)=features_v1(1,4432);          % extract GC content
        all_features(i,:)=features_part(1,1:503);
        
    elseif GcR>=0.5014  &  GcR< 0.5428 % GC range 5
        features_part(1,1:500)=features_v1(1,f5.features);% extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431);% extract ORF length
        features_part(1,503)=features_v1(1,4432);         % extract GC content 
        all_features(i,:)=features_part(1,1:503);
  
    elseif GcR>=0.5428  &  GcR< 0.5814 % GC range 6
        features_part(1,1:500)=features_v1(1,f6.features);% extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431);% extract ORF length
        features_part(1,503)=features_v1(1,4432);         % extract GC content
        all_features(i,:)=features_part(1,1:503);
        
    elseif GcR>=0.5814 &  GcR< 0.6185 % GC range 7
        features_part(1,1:500)=features_v1(1,f7.features);% extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431);% extract ORF length
        features_part(1,503)=features_v1(1,4432);         % extract GC content
        all_features(i,:)=features_part(1,1:503);
        
    elseif GcR>=0.6185  &  GcR< 0.65 % GC range 8
        features_part(1,1:500)=features_v1(1,f8.features);% extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431);% extract ORF length
        features_part(1,503)=features_v1(1,4432);         % extract GC content    
        all_features(i,:)=features_part(1,1:503);
    
  
    elseif GcR>=0.65  &  GcR< 0.6828 % GC range 9
        features_part(1,1:500)=features_v1(1,f9.features);% extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431);% extract ORF length
        features_part(1,503)=features_v1(1,4432);         % extract GC content
        all_features(i,:)=features_part(1,1:503);
        
    elseif GcR>=0.6828 &  GcR< 1 % GC range 10
        features_part(1,1:500)=features_v1(1,f10.features);% extract best 500 features
        features_part(1,501:502)=features_v1(1,4430:4431);% extract ORF length
        features_part(1,503)=features_v1(1,4432);         % extract GC content   
        all_features(i,:)=features_part(1,1:503);
        
    end %if
end % for

%save files
save('Test_orfSeqs_917.mat','all_features','-v7.3')
csvwrite('Test_orfSeqs_917.csv',all_features)


end %function