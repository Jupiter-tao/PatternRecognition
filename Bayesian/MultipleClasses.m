iris = load('iris.txt');
N=40;
%求第一类样本均值
for i = 1:N
    for j = 1:4
        w1(i,j) = iris(i,j+1); 
    end
end
sumx1 = sum(w1,1);
for i=1:4
    meanx1(1,i)=sumx1(1,i)/N;
end
%求第二类样本均值
for i = 1:N
    for j = 1:4
        w2(i,j) = iris(i+50,j+1);
    end
end
sumx2 = sum(w2,1);
for i=1:4
    meanx2(1,i)=sumx2(1,i)/N;
end
%求第三类样本均值
for i = 1:N
    for j = 1:4
        w3(i,j) = iris(i+100,j+1);
    end
end
sumx3 = sum(w3,1);
for i=1:4
    meanx3(1,i)=sumx3(1,i)/N;
end
%求第一类样本协方差矩阵
z1(4,4) = 0;
var1(4,4) = 0;
for i=1:4
for j=1:4
  for k=1:N
   z1(i,j)=z1(i,j)+(w1(k,i)-meanx1(1,i))*(w1(k,j)-meanx1(1,j));
  end
  var1(i,j) = z1(i,j) / (N-1);
 end
end
%求第二类样本协方差矩阵
z2(4,4) = 0 ; 
var2(4,4) = 0;
for i=1:4
 for j=1:4
  for k=1:N
   z2(i,j)=z2(i,j)+(w2(k,i)-meanx2(1,i))*(w2(k,j)-meanx2(1,j));
  end
  ar2(i,j) = z2(i,j) / (N-1);
end
end
%求第三类样本协方差矩阵
z3(4,4) = 0 ; 
var3(4,4) = 0;
for i=1:4
for j=1:4
  for k=1:N
   z3(i,j)=z3(i,j)+(w3(k,i)-meanx3(1,i))*(w3(k,j)-meanx3(1,j));
  end
  var3(i,j) = z3(i,j) /( N-1);
 end
end
%求各类的协方差矩阵逆矩阵及行列式
var1_inv = [];var1_det = [];
var2_inv = [];var2_det = [];
var3_inv = [];var3_det = [];
var1_inv = inv(var1)
var2_inv = inv(var2)
var3_inv = inv(var3)
var1_det = det(var1)
var2_det = det(var2)
var3_det = det(var3)
 
M=10;
for i = 1:M
    for j = 1:4
        test(i,j) = iris(i+50,j+1); % 取测试数据
    end
end
t1=0;t2=0;t3=0;
for i = 1:M
    x=test(i,1);y=test(i,2);
    z=test(i,3);h=test(i,4);
    g1 = (-0.5)*([x,y,z,h]-meanx1)*var1_inv*([x,y,z,h]'-meanx1') - 0.5*log(abs(var1_det)) + log(0.5);
    g2 = (-0.5)*([x,y,z,h]-meanx2)*var2_inv*([x,y,z,h]'-meanx2') - 0.5*log(abs(var2_det)) + log(0.5);
    if g1>g2
        t1=t1+1   %若g1>g2,则属于第一类，否则属于第二类
    else
        t2=t2+1
    end
end
