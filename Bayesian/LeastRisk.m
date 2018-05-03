x=[ -3.9847, -3.5549, -1.2401, -0.9780, -0.7932, -2.8531, -2.7605, -3.7287, -3.5414, -2.2692, -3.4549, -3.0752, -3.9934, -0.9780, -1.5799, -1.4885, -0.7431 , -0.4221 ,-1.1186,-2.3462, -1.0826, -3.4196, -1.3193, -0.8367, -0.6579, -2.9683,2.8792,0.7932,1.1882,3.0682,4.2532, 0.3271, 0.9846, 2.7648, 2.6588];
pw1=0.9; pw2=0.1;
m=numel(x); 			
R1_x=zeros(1,m); 		
R2_x=zeros(1,m);		
result=zeros(1,m); 		
e1=-2.1226; a1=1.2148;
e2=2.1019 ;a2=1.3163;
%风险决策表
r11=0;r12=1;
r21=6;r22=0;
for i=1:m 
%计算两类风险值
R1_x(i)=r11*pw1*normpdf(x(i),e1,a1)/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2))+r21*pw2*normpdf(x(i),e2,a2)/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2));
R2_x(i)=r12*pw1*normpdf(x(i),e1,a1)/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2))+r22*pw2*normpdf(x(i),e2,a2)/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2));
end
for i=1:m
    if R2_x(i)>R1_x(i)	%第二类比第一类风险大
        result(i)=0;		%正常细胞
    else
        result(i)=1;		%异常细胞
    end 
end
a=[-5:0.001:5] ;			%取样本点以画图
n=numel(a);
R1_plot=zeros(1,n);
R2_plot=zeros(1,n);
for j=1:n                   %计算各样本点的风险以画图
    R1_plot(j)=r11*pw1*normpdf(a(j),e1,a1)/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2))+r21*pw2*normpdf(a(j),e2,a2)/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2));
    R2_plot(j)=r12*pw1*normpdf(a(j),e1,a1)/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2))+r22*pw2*normpdf(a(j),e2,a2)/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2));
end
plot(a,R1_plot,a,R2_plot,'LineWidth',5);
xlabel('细胞的观察值');
ylabel('风险');
title('风险判决曲线');

