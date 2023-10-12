function [lightcolor1,lightcolor2]=drawing3(w,O,P,I,L,lightcolorall,mi,mj,n1,n2,n3,n4)
n=1;r=1;s=1;h=1;
if lightcolorall(mi)==0
    lightcolor1='r';
end
if lightcolorall(mi)==1
    lightcolor1='g';
end
if lightcolorall(mi)==2
    lightcolor1='#EDB120';
end
if lightcolorall(mj)==0
    lightcolor2='r';
end
if lightcolorall(mj)==1
    lightcolor2='g';
end
if lightcolorall(mj)==2
    lightcolor2='#EDB120';
end
R=[];W=[];Q=[];E=[];
if n1~=0
    while n<=n1
        car1=rectangle('Position',[3+3*w/4-0.1,O(n),0.2,0.3],'FaceColor',[0.9290 0.6940 0.1250],'Edgecolor','k','Linewidth',0.5);
        n=n+1;
        R=[R,car1];
    end
end
if n2~=0
    while r<=n2
        car2=rectangle('Position',[P(r),3+w/4-0.1,0.3,0.2],'FaceColor',[0.3010 0.7450 0.9330],'Edgecolor','k','Linewidth',0.5);
        r=r+1;
        W=[W,car2];
    end
end
if n3~=0
    while s<=n3
        car3=rectangle('Position',[3+w/4-0.1,6+w-I(s),0.2,0.3],'FaceColor',[0.4940 0.1840 0.5560],'Edgecolor','k','Linewidth',0.5);
        s=s+1;
        Q=[Q,car3];
    end
end
if n4~=0
    while h<=n4
        car4=rectangle('Position',[6+w-L(h),3+3*w/4-0.1,0.3,0.2],'FaceColor',[0.8500 0.3250 0.0980],'Edgecolor','k','Linewidth',0.5);
        h=h+1;
        E=[E,car4];
    end
end
rectangle('Position',[2.8 2.8+w 0.4 0.4],'Curvature',[1 1],'FaceColor',lightcolor1,"EdgeColor",lightcolor1);
rectangle('Position',[2.8+w 2.8+w 0.4 0.4],'Curvature',[1 1],'FaceColor',lightcolor2,"EdgeColor",lightcolor2);
rectangle('Position',[2.8 2.8 0.4 0.4],'Curvature',[1 1],'FaceColor',lightcolor2,"EdgeColor",lightcolor2);
rectangle('Position',[2.8+w 2.8 0.4 0.4],'Curvature',[1 1],'FaceColor',lightcolor1,"EdgeColor",lightcolor1);
pause(0.3);
delete(R);delete(W);delete(Q);delete(E);delete(rectangle);
end
