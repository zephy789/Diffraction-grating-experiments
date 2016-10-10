% Diffraction grating with monochromatic incident beam, with a single selected 
% order shown. Cross section of the geometry of a diffraction grating, a common
% illustration in textbooks of optics, spectroscopy, and analytical chemistry.
% The grating surface is at the bottom of the diagram, along the x axis.
% The line labeled "Incident beam" is the direction of the incoming light
% beam.  The dotted line is the diffracted (outgoing) beam. The line  
% labeled "Order 0" is the direction of the zeroth-order diffraction, 
% at the angle of specular reflection from the grating surface.   
% The upper left slider controls the angle of incidence, the lower 
% left slider controls the grating ruling density (lines/mm),
% the upper right slider controls the order, and the lower right
% slider controls the wavelength of the incident beam.
% incident beam.
% Calls GratingOrder1, GratingOrder2, GratingOrder3, and GratingOrder4 as  
% functions when sliders are adjusted.

global alphar
global angle0
global d
global lambda
global m

% User-modifiable parameters:
lambda = 500; %  Initial wavelength 
alphar = 1;   %  Initial value of angle of incidence
R=45;       %  Initial value of Grating Ruling density, lines/mm,
d=1000000/R;  %  Initial value of Groove spacing, in mn
m=80;          % Initial value of Diffraction Order 

close
figure(1);
clf
h=figure(1);
r=pi/2; % Constant used below

% Compute the angle of the zero-order beam and the X and Y coordinates for
% the endoint of the incident and zero-order beams. 
xi=-cos(r-alphar);yi=sin(r-alphar); % Incident beam
angle0 = asin(-sin(alphar));x0=-cos(r-angle0);y0=sin(r-angle0); % Zero order

% Compute the angle of the diffracted beam and the X and Y coordinates for
% its endpoint if the angle is on scale (90 degrees or less)
angle1 = asin(m*lambda/d-sin(alphar));if imag(angle1)==0;x1=-cos(r-angle1);y1=sin(r-angle1);else x1=0;y1=0;end;

% Draw line from 0,0 to the endpoint
plot([0 xi],[0 yi],'k',[0 x0],[0 y0],'k--',[0 x1],[0 y1],'k:')

% Compute and display the angular dispersion
AngularDispersison=asin(m*(lambda+1)/d-sin(alphar))-asin(m*lambda/d-sin(alphar));
text(-.4,1.4,['Angular Dispersion = '  num2str(AngularDispersison*360/(2*pi)) ' degrees/nm']);

% Add labels and title
text(xi,yi,'Incident beam');
if imag(angle0)==0;text(x0/2,y0/2,'Order 0');end;
if imag(angle1)==0;text(x1,y1,['Order ' num2str(m)]);end;
% Note: when the wavelength is adjusted, the order label is replaced with
% the wavelength.
title('Diffraction grating with monochromatic incident beam, single selected order shown.');
xlabel(['Angle = ' num2str(round(alphar*360/(2*pi))) ' degrees.   Wavelength = '  num2str(round(lambda)) ' nm.  Lines/mm = ' num2str(round(1000000/d)) '   Order = ' num2str(m)])

h2=gca;axis([-1 1 0 1.5]);

% Draw the sliders
rtslid(h,@GratingOrder1,h2,1,'Scale',[0 pi/2],'Def',alphar,'Back',[0.9 0.9 0.9],'Label','Angle','Position',[0.03 0.5 0.03 0.35]);
rtslid(h,@GratingOrder2,h2,0,'Scale',[0 1000],'Def',lambda,'Back',[0.9 0.9 0.9],'Label','Wavelength','Position',[0.95 0.05 0.03 0.35]);
rtslid(h,@GratingOrder3,h2,0,'Scale',[0 600],'Def',R,'Back',[0.9 0.9 0.9],'Label','Lines/mm','Position',[0.03 0.05 0.03 0.35]);
rtslid(h,@GratingOrder4,h2,0,'Scale',[0 150],'Def',m,'Back',[0.9 0.9 0.9],'Label','Order','Position',[0.95 0.5 0.03 0.35]);
