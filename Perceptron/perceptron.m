%读入xls中的数据
num=xlsread('data1');
len=length(num);
a=num(:,1);
b=num(:,2);
ab=[a,b];
X=reshape(ab,len,2); % X是数据集，Y是分类结果 
c=num(:,3);
Y=reshape(c,1,len);
%画图
n = size(Y,2);
for i = 1:n
    if Y(i) == 1
        plot(X(i,1),X(i,2),'rs'); %红方块
    end
    if Y(i) == -1
        plot(X(i,1),X(i,2),'b*'); %蓝星号
    end
    hold on;
end
%感知器算法
maxStep = 500;
learnRate = 0.2;
[n,m] = size(X);  
X = [X ones(n,1)];  
W=zeros(m+1,1);  
for step = 1:maxStep
    flag = true;
    for index = 1:n  
        if sign(X(index,:) * W) ~= Y(index)  
            flag = false;  
            W = W + learnRate * Y(index) .* X(index,:)';
        end  
    end  
    if flag == true  
        break;  
    end  
end
%画线
xline = linspace(0,5,50);
yline = -W(1)/W(2) * xline - W(3)/W(2); 
plot(xline,yline);