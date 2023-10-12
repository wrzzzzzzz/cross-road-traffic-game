%input according to the hints
w=input('the width of the road: ');
g=input('the time lapse of the green light: ');
r=input('the time lapse of the red light: ');
o=input('the time lapse of the orange light: ');
n=input('the total number of cars: ');
p=input('the probability that a car does not stop at the red light: ');
[n1,n2,n3,n4]=numberofcars(n);%randomly decide the number of cars on each route
U=[n1,n2,n3,n4];
crossroad(w);%draw the crossroad
j=6;
X=[];
%generate plates using recursion
for i=1:n
    X=plate(X,j);
end
PLATE=X;
lightcolorall=[];
%create a vector according to different time lapses
for d=1:r
    lightcolorall=[lightcolorall,0];
end
for d=1:g
    lightcolorall=[lightcolorall,1];
end
for d=1:o
    lightcolorall=[lightcolorall,2];
end
usefulnumber=1;
neededtimes=lightcolorall;
%create a vector large enough so as the lights will shine till the end
while usefulnumber<=(33+10*w+5*max(U))/(r+g+o)+10%probably larger than needed, just to be safe
    lightcolorall=[lightcolorall,neededtimes];
    usefulnumber=usefulnumber+1;
end
%vectors to store values concerning locations, possibilities and plates
O=[];P=[];I=[];L=[];prob1=[];prob2=[];prob3=[];prob4=[];PLATE1=[];PLATE2=[];PLATE3=[];PLATE4=[];
conditionall=[];
%place the cars' original states accordingly on each lane
%Also,give each car a plate and its "probability" to run a light(compared with "p" later)
if n1~=0
    for d=1:n1
        O=[O,(d-1)*(-0.5)];
        plate1=PLATE(6*d-5:6*d);
        PLATE1=[PLATE1,plate1];
        prob1=[prob1,rand];
    end
    conditionall=[conditionall,O(n1)];%store the original values for later use
end
if n2~=0
    for d=1:n2
        P=[P,(d-1)*(-0.5)];
        plate2=PLATE(6*n1+6*d-5:6*n1+6*d);
        PLATE2=[PLATE2,plate2];
        prob2=[prob2,rand];
    end
    conditionall=[conditionall,P(n2)];
end
if n3~=0
    for d=1:n3
        I=[I,(d-1)*(-0.5)];
        plate3=PLATE(6*n1+6*n2+6*d-5:6*n1+6*n2+6*d);
        PLATE3=[PLATE3,plate3];
        prob3=[prob3,rand];
    end
    conditionall=[conditionall,0.3+I(n3)];
end
if n4~=0
    for d=1:n4
        L=[L,(d-1)*(-0.5)];
        plate4=PLATE(6*n1+6*n2+6*n3+6*d-5:6*n1+6*n2+6*n3+6*d);
        PLATE4=[PLATE4,plate4];
        prob4=[prob4,rand];
    end
    conditionall=[conditionall,L(n4)-0.3];
end
mi=1;mj=r+1;
j=1;r=1;s=1;h=1;
flagall=false;
%vectors to store the plates of "bad cars" who disobey traffic rules
badcars1=[];badcars2=[];badcars3=[];badcars4=[];
axis([0 6+w 0 6+w]);%define the boundaries
axis off%erase the axis
while min(conditionall)<=3+w
    conditionall=[];
    if flagall==true
        break
    end
    [lightcolor1,lightcolor2]=drawing3(w,O,P,I,L,lightcolorall,mi,mj,n1,n2,n3,n4);%call the function that draws lights and cars
    flag1=0;flag2=0;flag3=0;flag4=0;
    if n1~=0%if the number distributed is zero, don't do the things considering the lane
        for j=1:n1
            if prob1(j)<=p&&O(j)>=2.695&&O(j)<=2.705%decide whether the car is the first at the crossing
                if lightcolor2=='g'%if the light is green, go ahead as it pleases
                    O(j)=O(j)+0.1;
                else
                    O(j)=O(j)+0.1;%if not a green light and it goes ahead, store it as a bad car
                    nnn=j;
                    badcars1=[badcars1,nnn];
                end
            else
                if O(j)<=2.695 || O(j)>=2.705
                    if flag1~=1 || O(j)>=2.705%if it's behind the cross,decide whether the car in the front has stopped;if not, go ahead
                        O(j)=O(j)+0.1;
                    else
                        O(j)=O(j);
                    end
                else
                    if lightcolor2=='g'%decide the motion of the first car
                        O(j)=O(j)+0.1;
                    else
                        O(j)=O(j);
                        flag1=1;%control the cars behind to stop
                    end
                end
            end
        end
        conditionall=[conditionall,O(j)];%store the final position
    end
    if n2~=0
        for r=1:n2
            if prob2(r)<=p&&P(r)>=2.695&&P(r)<=2.705
                if lightcolor1=='g'
                    P(r)=P(r)+0.1;
                else
                    P(r)=P(r)+0.1;
                    rrr=r;
                    badcars2=[badcars2,rrr];
                end
            else
                if P(r)<=2.695 || P(r)>=2.705
                    if flag2~=1 || P(r)>=2.705
                        P(r)=P(r)+0.1;
                    else
                        P(r)=P(r);
                    end
                else
                    if lightcolor1=='g'
                        P(r)=P(r)+0.1;
                    else
                        P(r)=P(r);
                        flag2=1;
                    end
                end
            end
        end
        conditionall=[conditionall,P(r)];
    end
    if n3~=0
        for s=1:n3
            if prob3(s)<=p&&I(s)>=2.995&&I(s)<=3.005
                if lightcolor2=='g'
                    I(s)=I(s)+0.1;
                else
                    I(s)=I(s)+0.1;
                    sss=s;
                    badcars3=[badcars3,sss];
                end
            else
                if I(s)<=2.995 || I(s)>=3.005
                    if flag3~=1 || I(s)>=3.005
                        I(s)=I(s)+0.1;
                    else
                        I(s)=I(s);
                    end
                else
                    if lightcolor2=='g'
                        I(s)=I(s)+0.1;
                    else
                        I(s)=I(s);
                        flag3=1;
                    end
                end
            end
        end
        conditionall=[conditionall,0.3+I(s)];
    end
    if n4~=0
        for h=1:n4
            if prob4(h)<=p&&L(h)>=2.995&&L(h)<=3.005
                if lightcolor1=='g'
                    L(h)=L(h)+0.1;
                else
                    L(h)=L(h)+0.1;
                    hhh=h;
                    badcars4=[badcars4,hhh];
                end
            else
                if L(h)<=2.995 ||L(h)>=3.005
                    if flag4~=1 || L(h)>=3.005
                        L(h)= L(h)+0.1;
                    else
                        L(h)= L(h);
                    end
                else
                    if lightcolor1=='g'
                        L(h)= L(h)+0.1;
                    else
                        L(h)= L(h);
                        flag4=1;
                    end
                end
            end
        end
        conditionall=[conditionall,L(h)-0.3];
    end
    %use the positions of bottoms to decide whether crashes happen
    if n2~=0&&n1~=0
        for r=1:n2
            for j=1:n1
                if P(r)+0.3>=3+3*w/4-0.1&&P(r)<=3+3*w/4-0.1+0.2
                    if 3+w/4-0.1<=O(j)+0.3&&3+w/4-0.1+0.2>=O(j)
                        disp("Game Over!");flagall=true;
                    end
                end
            end
        end
    end
    if n2~=0&&n3~=0
        for r=1:n2
            for s=1:n3
                if P(r)+0.3>=3+w/4-0.1&&P(r)<=3+w/4-0.1+0.2
                    if 3+w/4-0.1<=6+w-I(s)+0.3&&3+w/4-0.1+0.2>=6+w-I(s)
                        disp("Game Over!");flagall=true;
                    end
                end
            end
        end
    end
    if n4~=0&&n3~=0
        for h=1:n4
            for s=1:n3
                if 6+w-L(h)+0.3>=3+w/4-0.1&&6+w-L(h)<=3+w/4-0.1+0.2
                    if 3+3*w/4-0.1<=6+w-I(s)+0.3&&3+3*w/4-0.1+0.2>=6+w-I(s)
                        disp("Game Over!");flagall=true;
                    end
                end
            end
        end
    end
    if n4~=0&&n1~=0
        for h=1:n4
            for j=1:n1
                if  6+w-L(h)+0.3>=3+3*w/4-0.1&&6+w-L(h)<=3+3*w/4-0.1+0.2
                    if 3+3*w/4-0.1<=O(j)+0.3&&3+3*w/4-0.1+0.2>=O(j)
                        disp("Game Over!");flagall=true;
                    end
                end
            end
        end
    end
    mi=mi+1;mj=mj+1;%switch the lights to the next status
end
showthebadcars(PLATE,badcars1,badcars2,badcars3,badcars4,n1,n2,n3);%call a function to display the plates of the "bad cars"



