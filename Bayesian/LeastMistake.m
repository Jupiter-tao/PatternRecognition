x=[ -3.9847, -3.5549, -1.2401, -0.9780, -0.7932, -2.8531, -2.7605, -3.7287, -3.5414, -2.2692, -3.4549, -3.0752, -3.9934, -0.9780, -1.5799, -1.4885, -0.7431 , -0.4221 ,-1.1186,-2.3462, -1.0826, -3.4196, -1.3193, -0.8367, -0.6579, -2.9683,2.8792,0.7932,1.1882,3.0682,4.2532, 0.3271, 0.9846, 2.7648, 2.6588];
pw1=0.9; pw2=0.1;
e1=-2.1226; a1=1.2148;
e2=2.1019 ;a2=1.3163;
m=numel(x); 				
pw1_x=zeros(1,m); 			
pw2_x=zeros(1,m); 		
results=zeros(1,m);			
for i = 1:m
%计算在w1,w2下的后验概率 
pw1_x(i)=(pw1*normpdf(x(i),e1,a1))/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2)) ;
pw2_x(i)=(pw2*normpdf(x(i),e2,a2))/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2)) ;
end
for i = 1:m
    if pw1_x(i)>pw2_x(i)  %比较两类后验概率        
        result(i)=0;			%正常细胞
    else
        result(i)=1;			%异常细胞 
    end
end
a=[-5:0.001:5];  				%取样本点以画图
n=numel(a);
pw1_plot=zeros(1,n);
pw2_plot=zeros(1,n);
for j=1:n           %计算每个样本点对w1的后验概率以画图
pw1_plot(j)=(pw1*normpdf(a(j),e1,a1))/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2));
pw2_plot(j)=(pw2*normpdf(a(j),e2,a2))/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2));
end
plot(a,pw1_plot,a,pw2_plot,'LineWidth',5);
xlabel('细胞的观察值');
ylabel('后验概率');
title('后验概率分布曲线');