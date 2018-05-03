iris=load('iris.txt');
%求第一类样本均值
for i = 1:50
for j = 1:3
w1(i,j) = iris(i,j+1);
end
end

for i = 1:50
for j = 1:3
w2(i,j) = iris(i+50,j+1);
end
end

for i = 1:50
for j = 1:3
w3(i,j) = iris(i+100,j+1);
end
end

x= w1(:,1);
y= w1(:,2);
z= w1(:,3);

x2= w2(:,1);
y2= w2(:,2);
z2= w2(:,3);

x3= w3(:,1);
y3= w3(:,2);
z3= w3(:,3); 


plot3(x,y,z,'b*')
hold on
plot3(x2,y2,z2,'r+')
plot3(x3,y3,z3,'gs')
grid on;

