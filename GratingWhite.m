global alphar
global angle0
global d
global lambda1
global lambda2
global lambda3
global lambda4
global lambda5
global lambda6
global lambda7

% User-modifiable parameters:
alphar = .75; % initial value of angle of incidence
R=600;        % inital value of grating Ruling density, lines/mm,
d=1000000/R;  % initial value of groove spacing, in mn
lambda1=600;  % Wavelength 1, plotted as red line
lambda2=500;  % Wavelength 2, plotted as green line
lambda3=400;  % Wavelength 3, plotted as blue line
lambda4=300;  % Wavelength 4, plotted as dotted blue line
lambda5=200;  % Wavelength 5, plotted as dotted blue line
lambda6=700;  % Wavelength 6, plotted as magenta line
lambda7=800;  % Wavelength 7, plotted as dotted magenta line

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
% the endpoint of the line if the angle is 90 degrees or less.
m=1;          % Diffraction Order 
angle1 = asin(m*lambda1/d-sin(alphar));if imag(angle1)==0;x1=-cos(r-angle1);y1=sin(r-angle1);else x1=0;y1=0;end;
angle2 = asin(m*lambda2/d-sin(alphar));if imag(angle2)==0;x2=-cos(r-angle2);y2=sin(r-angle2);else x2=0;y2=0;end;
angle3 = asin(m*lambda3/d-sin(alphar));if imag(angle3)==0;x3=-cos(r-angle3);y3=sin(r-angle3);else x3=0;y3=0;end;
angle4 = asin(m*lambda4/d-sin(alphar));if imag(angle4)==0;x4=-cos(r-angle4);y4=sin(r-angle4);else x4=0;y4=0;end;
angle5 = asin(m*lambda5/d-sin(alphar));if imag(angle5)==0;x5=-cos(r-angle5);y5=sin(r-angle5);else x5=0;y5=0;end;
m=2;          % Diffraction Order 
angle6 = asin(m*lambda1/d-sin(alphar));if imag(angle6)==0;x6=-.8.*cos(r-angle6);y6=.8.*sin(r-angle6);else x6=0;y6=0;end;
angle7 = asin(m*lambda2/d-sin(alphar));if imag(angle7)==0;x7=-.8.*cos(r-angle7);y7=.8.*sin(r-angle7);else x7=0;y7=0;end;
angle8 = asin(m*lambda3/d-sin(alphar));if imag(angle8)==0;x8=-.8.*cos(r-angle8);y8=.8.*sin(r-angle8);else x8=0;y8=0;end;
angle9 = asin(m*lambda4/d-sin(alphar));if imag(angle9)==0;x9=-.8.*cos(r-angle9);y9=.8.*sin(r-angle9);else x9=0;y9=0;end;
angle10 = asin(m*lambda5/d-sin(alphar));if imag(angle10)==0;x10=-.8.*cos(r-angle10);y10=.8.*sin(r-angle10);else x10=0;y10=0;end;
m=1;
angle11 = asin(m*lambda6/d-sin(alphar));if imag(angle11)==0;x11=-cos(r-angle11);y11=sin(r-angle11);else x11=0;y11=0;end;
angle12 = asin(m*lambda7/d-sin(alphar));if imag(angle12)==0;x12=-cos(r-angle12);y12=sin(r-angle12);else x12=0;y12=0;end;
m=2;
angle13 = asin(m*lambda6/d-sin(alphar));if imag(angle13)==0;x13=-.8.*cos(r-angle13);y13=.8.*sin(r-angle13);else x13=0;y13=0;end;
angle14 = asin(m*lambda7/d-sin(alphar));if imag(angle14)==0;x14=-.8.*cos(r-angle14);y14=.8.*sin(r-angle14);else x14=0;y14=0;end;

% Draw lines from 0,0 to the endpoints
plot([0 xi],[0 yi],'k',[0 x0],[0 y0],'k',...
    [0 x1],[0 y1],'r',[0 x2],[0 y2],'g',[0 x3],[0 y3],'b',...
    [0 x4],[0 y4],'c:',[0 x5],[0 y5],'c:',[0 x6],[0 y6],'r',...
    [0 x7],[0 y7],'g',[0 x8],[0 y8],'b',[0 x9],[0 y9],'c:',[0 x10],[0 y10],'c:',...
    [0 x11],[0 y11],'m',[0 x12],[0 y12],'m:',[0 x13],[0 y13],'m',[0 x14],[0 y14],'m:')

% Add labels and title
xlabel(['Angle of incidence = ' num2str(alphar*360/(2*pi)) ' degrees.   Lines/mm= '  num2str(1000000/d)])
title('Diffraction grating with white incident beam, illustrating overlap of orders +1and +2.');
text(xi,yi,'Incident beam');
text(x0,y0,'Zero order');
% Label diffracted beams if it is on scale (90 degrees or less)
if imag(angle1)==0;text(x1,y1,[num2str(lambda1) ' nm. m=1']);end;
if imag(angle2)==0;text(x2,y2,[num2str(lambda2) ' nm. m=1']);end;
if imag(angle3)==0;text(x3,y3,[num2str(lambda3) ' nm. m=1']);end;
if imag(angle4)==0;text(x4,y4,[num2str(lambda4) ' nm. m=1']);end;
if imag(angle5)==0;text(x5,y5,[num2str(lambda5) ' nm. m=1']);end;
if imag(angle6)==0;text(x6,y6,[num2str(lambda1) ' nm. m=2']);end;
if imag(angle7)==0;text(x7,y7,[num2str(lambda2) ' nm. m=2']);end;
if imag(angle8)==0;text(x8,y8,[num2str(lambda3) ' nm. m=2']);end;
if imag(angle9)==0;text(x9,y9,[num2str(lambda4) ' nm. m=2']);end;
if imag(angle10)==0;text(x10,y10,[num2str(lambda5) ' nm. m=2']);end;
if imag(angle11)==0;text(x11,y11,[num2str(lambda6) ' nm. m=1']);end;
if imag(angle12)==0;text(x12,y12,[num2str(lambda7) ' nm. m=1']);end;
if imag(angle13)==0;text(x13,y13,[num2str(lambda6) ' nm. m=2']);end;
if imag(angle14)==0;text(x14,y14,[num2str(lambda7) ' nm. m=2']);end;
h2=gca;axis([-1 1 0 1.5]);

% Draw the sliders
rtslid(h,@GratingWhite1,h2,1,'Scale',[0 pi/2],'Def',alphar,'Back',[0.9 0.9 0.9],'Label','Angle');
rtslid(h,@GratingWhite2,h2,0,'Scale',[0 2400],'Def',600,'Back',[0.9 0.9 0.9],'Label','Lines/mm','Position',[0.95 0.1 0.03 0.8]);
