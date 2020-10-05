clear all;clc

tic
st=1;
num1=40;
num2=30;
num3=120;
num4=80;
theta = linspace(-pi, pi, num1);
phi = linspace(0., 2.*pi, num2);
theta1 = linspace(-pi, pi, num3);
phi1 = linspace(0., 2.*pi, num4);

% r0=0.4;
% r1=1.2;
% rmax=30;
% rmin=10;

r0=0.2;
r1=0.6;
rmax=30;
rmin=10;



num=num1*num2*num3*num4;
x=zeros(num,3);
x1=zeros(num,3);

for ii=1:num1
    for jj=1:num2
        for kk=1:num3
            for mm=1:num4
                s1=theta(ii);
                s2=phi(jj);
                s3=theta1(kk);
                s4=phi1(mm);
                x(st,1)=(r1+r0.*cos(s4)).*cos(s3);
                x(st,2)=(r1+r0.*cos(s4)).*sin(s3);
                x(st,3)=r0.*sin(s4);
                x1(st,1)=x(st,1)+(rmax+rmin.*cos(s2)).*cos(s1);
                x1(st,2)=x(st,2)+(rmax+rmin.*cos(s2)).*sin(s1);
                x1(st,3)=x(st,3)+rmin.*sin(s2);
                st=st+1;
%                 x(kk,mm)=(r1+r0.*cos(s4)).*cos(s3);
%                 y(kk,mm)=(r1+r0.*cos(s4)).*sin(s3);
%                 z(kk,mm)=r0.*sin(s4);
%                 x1(ii,jj)=x(kk,mm)+(rmax+rmin.*cos(s2)).*cos(s1);
%                 y1(ii,jj)=y(kk,mm)+(rmax+rmin.*cos(s2)).*sin(s1);
%                 z1(ii,jj)=z(kk,mm)+rmin.*sin(s2);
            end
        end
    end
end
toc

% torus plotting
% surf(x1,y1,z1);
% shading flat;
% axis equal
scatter3(x1(:,1),x1(:,2),x1(:,3),0.5,[0.5,0.5,0.5]);