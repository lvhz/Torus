clc;clear all;close all;

%% supercell
a=1;
% k=linspace(-pi,pi,nk);
nk=300;
t1=linspace(0,3,nk);
t2=1;
layer=6;
H=zeros(81,81);%定义H为81*81的矩阵%%%total are 81 sites
E=zeros(nk,81);%定义E为1*81的矩阵

    %厄米共轭矩阵元H(i,j)=H(j,i)*,如H_13=H_31*
for j=1:nk 
    H11=[0]; 
    H(1,1)=H11;
    %第1层
    
    H21=[0,0,t2,0,0,0;
         0,0,0,t2,0,0;
         t2,0,0,0,t1(j),0;
         0,t2,0,0,t1(j),0;
         0,0,t1(j),t1(j),0,t1(j);
         0,0,0,0,t1(j),0];
%      H22=[0,t2;
%          t2,0];
     H(2:7,2:7)=H21;
     H(1,7)=t2;
     H(7,1)=t2;%第2层与1层相互作用项 
     %第2层
     
  H31=[0,0,0,t2,0,0,0,0,0,0,0;
       0,0,0,0,t2,t2,0,0,0,0,0;
       0,0,0,0,0,0,t2,0,0,0,0;
       t2,0,0,0,0,0,0,t1(j),0,0,0;
       0,t2,0,0,0,0,0,t1(j),0,0,0;
       0,t2,0,0,0,0,0,0,t1(j),0,0;
       0,0,t2,0,0,0,0,0,t1(j),0,0;
       0,0,0,t1(j),t1(j),0,0,0,0,t1(j),0;
       0,0,0,0,0,t1(j),t1(j),0,0,0,t1(j);
       0,0,0,0,0,0,0,t1(j),0,0,0;
       0,0,0,0,0,0,0,0,t1(j),0,0];
%    H32=[0,0,t2,0;
%        0,0,0,t2;
%        t2,0,0,0;
%        0,t2,0,0];
   H(8:18,8:18)=H31;
   H(2,17)=t2;
   H(3,18)=t2;
   H(17,2)=t2;
   H(18,3)=t2;%第3层与第2层相互作用项
   %第3层
   
   H41=[0,0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,t2,t2,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,t2,t2,0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,t2,0,0,0,0,0,0;
        t2,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0;
        0,t2,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0;
        0,t2,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0;
        0,0,t2,0,0,0,0,0,0,0,0,t1(j),0,0,0,0;
        0,0,t2,0,0,0,0,0,0,0,0,0,t1(j),0,0,0;
        0,0,0,t2,0,0,0,0,0,0,0,0,t1(j),0,0,0;
        0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,t1(j),0,0;
        0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,t1(j),0;
        0,0,0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,t1(j);
        0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0];
%     H42=[0,0,0,t2,0,0;
%          0,0,0,0,t2,0;
%          0,0,0,0,0,t2;
%          t2,0,0,0,0,0;
%          0,t2,0,0,0,0;
%          0,0,t2,0,0,0];
   H(19:34,19:34)=H41;
   H(8,32)=t2;
   H(9,33)=t2;
   H(10,34)=t2;
   H(32,8)=t2;
   H(33,9)=t2;
   H(34,10)=t2;%第4层与第3层相互作用项
   %第4层
   
   H51=[0,0,0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,0,t2,t2,0,0,0,0,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,t2,t2,0,0,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,t2,t2,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,0,t2,0,0,0,0,0,0,0,0;
        t2,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0;
        0,t2,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0;
        0,t2,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0;
        0,0,t2,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0;
        0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0;
        0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0;
        0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0;
        0,0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0;
        0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0;
        0,0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,0,0,t1(j),0,0;
        0,0,0,0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,0,t1(j),0;
        0,0,0,0,0,0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,t1(j);
        0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0];
%     H52=[0,0,0,0,t2,0,0,0;
%          0,0,0,0,0,t2,0,0;
%          0,0,0,0,0,0,t2,0;
%          0,0,0,0,0,0,0,t2;
%          t2,0,0,0,0,0,0,0;
%          0,t2,0,0,0,0,0,0;
%          0,0,t2,0,0,0,0,0;
%          0,0,0,t2,0,0,0,0];
     H(35:55,35:55)=H51;
     H(19,52)=t2;
     H(20,53)=t2;
     H(21,54)=t2;
     H(22,55)=t2;
     H(52,19)=t2;
     H(53,20)=t2;
     H(54,21)=t2;
     H(55,22)=t2;%第5层与第4层相互作用项
     
     %第5层
     
     H61=[0,0,0,0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
          0,0,0,0,0,0,0,t2,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
          0,0,0,0,0,0,0,0,0,t2,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
          0,0,0,0,0,0,0,0,0,0,0,t2,t2,0,0,0,0,0,0,0,0,0,0,0,0,0;
          0,0,0,0,0,0,0,0,0,0,0,0,0,t2,t2,0,0,0,0,0,0,0,0,0,0,0;
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t2,0,0,0,0,0,0,0,0,0,0;
          t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0,0,0;
          0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0,0,0;
          0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0,0;
          0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0,0;
          0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0;
          0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0;
          0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0;
          0,0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0;
          0,0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0;
          0,0,0,0,0,t2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0;
          0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0;
          0,0,0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0;
          0,0,0,0,0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0;
          0,0,0,0,0,0,0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,0,0,0,t1(j),0;
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),t1(j),0,0,0,0,0,0,0,0,0,t1(j);
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0,0,0;
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0,0;
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0,0;
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0,0;
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,t1(j),0,0,0,0,0];
%       H62=[0,0,0,0,0,t2,0,0,0,0;
%            0,0,0,0,0,0,t2,0,0,0;
%            0,0,0,0,0,0,0,t2,0,0;
%            0,0,0,0,0,0,0,0,t2,0;
%            0,0,0,0,0,0,0,0,0,t2;
%            t2,0,0,0,0,0,0,0,0,0;
%            0,t2,0,0,0,0,0,0,0,0;
%            0,0,t2,0,0,0,0,0,0,0;
%            0,0,0,t2,0,0,0,0,0,0;
%            0,0,0,0,t2,0,0,0,0,0];   
      
   H(56:81,56:81)=H61;
   H(35,77)=t2;
   H(36,78)=t2;
   H(37,79)=t2;
   H(38,80)=t2;
   H(39,81)=t2;
   H(77,35)=t2;
   H(78,36)=t2;
   H(79,37)=t2;
   H(80,38)=t2;
   H(81,39)=t2;%第6层与5层相互作用项
   %第6层 
       
     [V,D]=eig(H);%求解矩阵，得到对角元本征值D80个和本征向量V;
     E(j,:)=diag(D);%将本征值提取出来赋值给E的第j行，200个循环
end
%% Band structure plotting
 for j=1:81;
scatter(t1/t2,E(:,j),0.1,[0,0,1]); %提取数据的第j列，以列为数据单位画图，一列包含200行
hold on;%循环100次，一次画一条能带
 end
 
 ylabel('\epsilon','FontName','Times New Roman','FontSize',14,'FontWeight','bold');
 title('Band evolution of decorated honeycomb model','FontName','Times New Roman','FontSize',14,'FontWeight','bold');