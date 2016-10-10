function GratingMono1(n,h)
% Function called by GratingMomo.m
% Re-draws the graph when the angle of incident slider is adjusted.
global alphar
global angle0
global d
global lambda

alphar=n;   % angle of incidence
axes(h);

r=pi/2;% Constant used below
angle0 = asin(-sin(alphar));xi=-cos(r-alphar);yi=sin(r-alphar); % Incident beam
x0=-cos(r-angle0);y0=sin(r-angle0); % Zero order

m=1;          % Diffraction Order 
angle1 = asin(m*lambda/d-sin(alphar));if imag(angle1)==0;x1=-cos(r-angle1);y1=sin(r-angle1);else x1=0;y1=0;end;
m=-1;          % Diffraction Order 
angle2 = asin(m*lambda/d-sin(alphar));if imag(angle2)==0;x2=-cos(r-angle2);y2=sin(r-angle2);else x2=0;y2=0;end;
m=2;          % Diffraction Order 
angle3 = asin(m*lambda/d-sin(alphar));if imag(angle3)==0;x3=-.8.*cos(r-angle3);y3=.8.*sin(r-angle3);else x3=0;y3=0;end;
m=-2;          % Diffraction Order 
angle4 = asin(m*lambda/d-sin(alphar));if imag(angle4)==0;x4=-.8.*cos(r-angle4);y4=.8.*sin(r-angle4);else x4=0;y4=0;end;
m=3;          % Diffraction Order 
angle5 = asin(m*lambda/d-sin(alphar));if imag(angle5)==0;x5=-.6.*cos(r-angle5);y5=.6.*sin(r-angle5);else x5=0;y5=0;end;
m=-3;          % Diffraction Order 
angle6 = asin(m*lambda/d-sin(alphar));if imag(angle6)==0;x6=-.6.*cos(r-angle6);y6=.6.*sin(r-angle6);else x6=0;y6=0;end;
m=4;          % Diffraction Order 
angle7 = asin(m*lambda/d-sin(alphar));if imag(angle7)==0;x7=-.4.*cos(r-angle7);y7=.4.*sin(r-angle7);else x7=0;y7=0;end;
m=-4;          % Diffraction Order 
angle8 = asin(m*lambda/d-sin(alphar));if imag(angle8)==0;x8=-.4.*cos(r-angle8);y8=.4.*sin(r-angle8);else x8=0;y8=0;end;

plot([0 xi],[0 yi],'k',[0 x0],[0 y0],'k--',...
    [0 x1],[0 y1],'k:',[0 x2],[0 y2],'k:',[0 x3],[0 y3],'k:',...
    [0 x4],[0 y4],'k:',[0 x5],[0 y5],'k:',[0 x6],[0 y6],'k:',...
    [0 x7],[0 y7],'k:',[0 x8],[0 y8],'k:')
text(xi,yi,'Incident beam');
if imag(angle0)==0;text(x0,y0,'0');end;
if imag(angle1)==0;text(x1,y1,' 1');end;
if imag(angle2)==0;text(x2,y2,' -1');end;
if imag(angle3)==0;text(x3,y3,' 2');end;
if imag(angle4)==0;text(x4,y4,' -2');end;
if imag(angle5)==0;text(x5,y5,' 3');end;
if imag(angle6)==0;text(x6,y6,' -3');end;
if imag(angle7)==0;text(x7,y7,' 4');end;
if imag(angle8)==0;text(x8,y8,' -4');end;
xlabel(['Angle = ' num2str(alphar*360/(2*pi)) ' degrees.   Wavelength= '  num2str(lambda) ' nm.  Lines/mm= ' num2str(1000000/d) ])
title('Diffraction grating with monochromatic incident beam, orders -4 to +4.');

axis([-1 1 0 1.5]); % Update plot