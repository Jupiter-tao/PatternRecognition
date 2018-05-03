%����xls�е�����
num=xlsread('data1');
len=length(num);
a=num(:,1);
b=num(:,2);
ab=[a,b];
X=reshape(ab,len,2); % X�����ݼ���Y�Ƿ����� 
c=num(:,3);
Y=reshape(c,1,len);
%��ͼ
n = size(Y,2);
for i = 1:n
    if Y(i) == 1
        plot(X(i,1),X(i,2),'rs'); %�췽��
    end
    if Y(i) == -1
        plot(X(i,1),X(i,2),'b*'); %���Ǻ�
    end
    hold on;
end
%��֪���㷨
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
%����
xline = linspace(0,5,50);
yline = -W(1)/W(2) * xline - W(3)/W(2); 
plot(xline,yline);