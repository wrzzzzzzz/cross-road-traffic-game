function showthebadcars(PLATE,badcars1,badcars2,badcars3,badcars4,n1,n2,n3)
for i=1:numel(badcars1)
    dan=badcars1(i);
    disp(PLATE(6*dan-5:6*dan));
end
for i=1:numel(badcars2)
    dan=badcars2(i);
    disp(PLATE(6*n1+6*dan-5:6*n1+6*dan));
end
for i=1:numel(badcars3)
    dan=badcars3(i);
    disp(PLATE(6*n1+6*n2+6*dan-5:6*n1+6*n2+6*dan));
end
for i=1:numel(badcars4)
    dan=badcars4(i);
    disp(PLATE(6*n1+6*n2+6*n3+6*dan-5:6*n1+6*n2+6*n3+6*dan));
end
end