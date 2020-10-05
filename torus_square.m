clc;clear all;
am= 10.; % Torus minor radius
rm = 30.; % Torus major radius
r0=0.1;  % Inner torus minor radius
r1=0.3; % Inner torus major radius

num1=30;
num2=20;
theta  = linspace(-pi, pi, num1)   ; % Poloidal angle
phi    = linspace(0., 2.*pi, num2) ; % Toroidal angle
[t, p] = meshgrid(phi, theta);

num3=40;
num4=50;
theta1  = linspace(-pi, pi, num3)   ; % Poloidal angle
phi1    = linspace(0., 2.*pi, num4) ; % Toroidal angle


x1=zeros(num1,num2);
y1=zeros(num1,num2);
z1=zeros(num1,num2);

figure
for ii=1:num3
%     ii
    for jj=1:num4
        x = (r1+ r0.*cos(p)) .* cos(t);
        y = ( r1+ r0.*cos(p)) .* sin(t);
        z = r0.*sin(p);
        x1 = x + (rm + am.*cos(theta1(ii))) .*cos(phi1(jj));
        y1 = y + (rm + am.*cos(theta1(ii))) .*sin(phi1(jj));
        z1 = z + am.*sin(theta1(ii));
        surf(x1, y1, z1);hold on
    end
end

shading flat
axis equal
% set(gca,'xtick',[],'ytick',[],'ztick',[],'xticklabel',[],'yticklabel',[],'zticklabel',[])

% set(gca,'xtick',[],'xticklabel',[],'xColor','white')
% set(gca,'ytick',[],'yticklabel',[],'yColor','white')
% set(gca,'ztick',[],'zticklabel',[],'zColor','white')

set(gca,'box','off');
set(gca,'xcolor','w','ycolor','w','xtick',[],'ytick',[],'ztick',[]);
axis off;
