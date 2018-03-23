function classout=finalGeneSelection(post1,Orfs,omax)

classout=2*ones(1,size(Orfs,1));
fragsOrfs=zeros(1,1);
fragsPost=zeros(1,1);

if ~isempty(Orfs)
for i=0:Orfs(end,1)
  
    indices=find(Orfs(:,1)==i);
    fragsOrfs=Orfs(indices,:);
    fragsPost=post1(indices);
    C= find(fragsPost>0.5);
    fragsOrfs=fragsOrfs(C,:);
    fragsPost=fragsPost(C);
    indices=indices(C);
    
    while ~isempty(fragsPost)
        [tmp imax]=max(fragsPost);
        classout(indices(imax))=1;
        index=fragsOrfs(imax,2:3);
        removeJ=zeros(1,size(fragsOrfs,1));
        removeJ(imax)=1;
        for j=1:size(fragsOrfs,1)
            if ~removeJ(j)
                c_index=fragsOrfs(j,2:3);
                overlap=min(index(2),c_index(2))-max(c_index(1),index(1));
                if overlap >omax
                    removeJ(j)=1;
                end%if overlap
            end% if ~remove
            
        end% for
        fragsOrfs(removeJ==1,:)=[];
        fragsPost(removeJ==1)=[];
        indices(removeJ==1)=[];
    end% while
end %for 
        
        
end % if
        
end%function