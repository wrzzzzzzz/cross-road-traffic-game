function X=plate(X,j)
if j==1
    t=['A':'Z'];p=randi(26);q=t(p);X=[X,q];
else
    j=j-1;X=plate(X,j);f=['A':'Z','0':'9'];s=randi(36);m=f(s);X=[X,m];
end
end
