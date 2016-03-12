clc 
clear all
id=input('Enter the probability of symbols in row matrix form:\n');
ha(:,1)=(my_sort(id))';
b(:,1)=0;
l=length(id);
u=l;
for o=2:l-1
    u=u-1;
    ha(u,o)=ha(u+1,o-1)+ha(u,o-1);
    buf= ha(u,o);
    ha(1:u-1,o)=ha(1:u-1,o-1);
    ha(:,o)=(my_sort(ha(:,o)'))';
    ind=see_for(ha(:,o)',buf);
    b(ind,o)=1;
end 
hc=cell(l,l-1);

hc{1,l-1}=[0];
hc{2,l-1}=[1];
u=2;
for o=l-2:-1:1
    bc=hc{see_for(b(:,o+1),1),o+1};
    u=u+1;
    for k=1:u
            if(u-k>1)
                y=see_for(ha(:,o+1)',ha(k,o));
                hc{k,o}=hc{y,o+1};
            elseif(u-k==1)
               hc{k,o}= [bc,0];
            else
                hc{k,o}= [bc,1];
            end 
    end 
end     
for j=1:length(id)
    rank(j)=1;
   for h=1:length(id)
       if(id(j)<id(h))
           rank(j)=rank(j)+1;
       end 
   end 
end 
for j=1:length(id)
    count=1;
   for h=1:length(id)
       if(rank(j)==rank(h))&&j~=h
           rank(h)=rank(h)+count;
           count=count+1;
       end 
   end 
end 

for j=1:length(id)
     flag=0;
    for h=1:length(id)
        if (j==rank(h))&&flag==0
            flag=1;
            encoded{h,1}=hc{j,1};
        end 
    end 
end 
for h=1:length(id)
        display('The encoding of symbol with probablity');
        display('this is just a statement');
end         