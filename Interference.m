% Interactive simulation of a diffraction grating spectrum.
% A diffraction grating with N grooves is illuminated by monochromatic light. 
% When viewed at an angle, the reflections from each groove are slightly 
% phase shifted by small path length differences.  When these reflections
% are all added up, a diffraction pattern emerges that shows intensity maxima
% whenever the path length difference is an integral number of wavelengths 
% (called the "order"), thereby resulting in constructive interference. If
% the number of grooves is large anough, these maxima are very sharp and
% the intensity is nearly zero everywhere else.
% Sliders on the graph allow you to adjust the path length difference 
% between adjacent grooves (pld) and the number of grooves (N).
% Calls Interference1 and Interference2 as functions when sliders are
% adjusted.

global N 
global pld  

N = 3;  % Number of grooves in the grating
pld = .1;  % Path Length Difference between replections from adjacent grooves
maxpld=14; % Maximum value of pld slider (you can change this if desired)
maxN=100;  % Maximum value of N slider  (you can change this if desired)

close
figure(1);
clf
h=figure(1);
x=[0:.1:pi];  % x-axis for plot
z=zeros(size(x));
a=0;
clear S
  for j=1:N, 
     y=sin(3.*x+a); % waveform of one reflection from grating groove.
     z=z+y;   % z is waveform resulting from superimposition of j reflections
     S(j,:)=y;
     a=a+pld;
  end
  plot(x,S,'k',x,z./N,'r') 
  intensity=sum(z.*z)./N^2;  % calculates mean amplitude
  title('Black lines: Electric vectors of the separate waves from each groove')
  xlabel('Red line: electric vector of light waveform reaching the detector')
    text(0,1.1,['    Grating has ' num2str(N) ' grooves.   Path length difference = ' num2str(pld./(2*pi)) ' wavelengths'])
  text(0,-1.1,['               Total intensity of sum of all waves:' num2str(intensity) ])
  h2=gca;axis([0 3 -1.2 1.2]);

% Draw the sliders
rtslid(h,@Interference2,h2,1,'Scale',[0 maxpld],'Def',.1,'Back',[0.9 0.9 0.9],'Label','PLD');
rtslid(h,@Interference1,h2,1,'Scale',[0 maxN],'Def',3,'Back',[0.9 0.9 0.9],'Label','N','Position',[0.95 0.1 0.03 0.8]);
