%https://uk.mathworks.com/help/antenna/examples/helical-antenna-design.html
 
%Cleanup workspace from previous runs
close all
clear all
 
%Helical antenna properties
%All dimensions in meters unless otherwise stated
 
%Diameter of antenna wire turns
D           = 39.79e-3;
 
%Radius of antenna wire turns
radius      = D/2;
 
%Diameter of wire used
width       = 1.0e-3;
 
%Feedheight of the antenna element above the ground plane
feedheight  = 0.001;
 
%Number of turns of the antenna
turns       = 4;
 
%Spacing between turns
spacing     = 0.03125;
 
%Ground plane radius
radiusGP    = 100e-3;
 
%The antenna's working frequency
AntennaFreq = 1.55e9;
 
%Characteristic impedance of the antenna, in ohms
z0 = 50;
 
%Create a helical antenna with the previously defined parameters
hx = helix('Radius',radius,'Width',width,'Turns',turns,...
           'Spacing',spacing,'GroundPlaneRadius',radiusGP,...
           'FeedStubHeight',feedheight);
 
%Create a figure
figure;
 
%Show a model of the antenna
show(hx);
 
%Create another figure 
figure;
 
%Show the radiation pattern of the antenna
pattern(hx,AntennaFreq);
 
%Create another figure
figure;
 
%Show the radiation pattern of the antenna
patternAzimuth(hx,AntennaFreq)
 
%Create another figure
figure
 
%Show the radiation pattern of the antenna in a different plane
patternElevation(hx,AntennaFreq)
 
%Create a final figure
figure;
 
%Define the start, stop and step values for the return loss calculations
Fstart = AntennaFreq - 0.5e9;
Fstop  = AntennaFreq + 1.5e9;
Fstep   = 1e7;
 
%Calculate return loss parameters
S = sparameters(hx,Fstart:Fstep:Fstop,z0);
 
%Plot the return loss of the antenna
rfplot(S)
