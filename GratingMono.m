% Diffraction grating geometry with monochromatic light, orders +4 to -4 shown.
% Cross section of the geometry of a diffraction grating, a common
% illustration in textbooks of optics, spectroscopy, and analytical chemistry.
% The grating surface is at the bottom of the diagram, along the x axis.
% The line labeled "Incident beam" is the direction of the incoming light
% beam.  The line labeled "0" is the direction of the zeroth-order
% diffraction, at the angle of specular reflection from the grating
% surface.  The upper left slider controls the angle of incidence,
% the lower left slider controls the grating ruling density (lines/mm),
% and the lower right slider controls the wavelength of the
% incident beam.
% Calls GratingMono1, GratingMono2, and GratingMono3 as functions when 
% sliders are adjusted.

global alphar
global angle0
global d
global lambda

% User-modifiable parameters:
lambda = 187;  % initial value of wavelength
alphar = .75;   % initial value of angle of incidence
R=320;       % initial value of grating ruling density, lines/mm,
d=1000000/R;  % initial value of groove spacing, in mn

close
figure(1);
clf
h=figure(1);
r=pi/2; % Constant used below

% Compute the angle of the zero-order beam and the X and Y coordinates for
% the endoint of the incident and zero-order beams. 
xi=-cos(r-alphar);yi=sin(r-alphar); % Incident beam
angle0 = asin(-sin(alphar));x0=-cos(r-angle0);y0=sin(r-angle0); % Zero order

% Compute the angle of each diffracted beam and the X and Y coordinates for
% the endpoint of the line if the angle is on scale (90 degrees or less)
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

% Draw lines from 0,0 to the endpoints
plot([0 xi],[0 yi],'k',[0 x0],[0 y0],'k--',...
    [0 x1],[0 y1],'k:',[0 x2],[0 y2],'k:',[0 x3],[0 y3],'k:',...
    [0 x4],[0 y4],'k:',[0 x5],[0 y5],'k:',[0 x6],[0 y6],'k:',...
    [0 x7],[0 y7],'k:',[0 x8],[0 y8],'k:')

% Add labels and title
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
title('Diffraction grating with monochromatic incident beam, orders -4 to +4.');
xlabel(['Angle = ' num2str(alphar*360/(2*pi)) ' degrees.   Wavelength= '  num2str(lambda) ' nm.  Lines/mm= ' num2str(1000000/d) ])

h2=gca;axis([-1 1 0 1.5]);

% Draw the sliders
rtslid(h,@GratingMono1,h2,1,'Scale',[0 pi/2],'Def',alphar,'Back',[0.9 0.9 0.9],'Label','Angle','Position',[0.03 0.5 0.03 0.35]);
rtslid(h,@GratingMono2,h2,0,'Scale',[0 1000],'Def',500,'Back',[0.9 0.9 0.9],'Label','Wavelength','Position',[0.95 0.05 0.03 0.35]);
rtslid(h,@GratingMono3,h2,0,'Scale',[0 2400],'Def',600,'Back',[0.9 0.9 0.9],'Label','Lines/mm','Position',[0.03 0.05 0.03 0.35]);
