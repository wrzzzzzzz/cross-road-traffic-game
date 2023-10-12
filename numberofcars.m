function [n1,n2,n3,n4]=numberofcars(n)
X1=[];X2=[];X3=[];X4=[];
for i=1:n
    t=rand;
    if t>0&&t<0.25
        X1=[X1,t];
    end
    if 0.25<=t&&t<0.5
        X2=[X2,t];
    end
    if 0.5<=t&&t<0.75
        X3=[X3,t];
    end
    if 0.75<=t&&t<1
        X4=[X4,t];
    end
    n1=numel(X1);n2=numel(X2);n3=numel(X3);n4=numel(X4);
end
end


    
