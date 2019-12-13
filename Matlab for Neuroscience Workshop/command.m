%WELCOME TO OUR WORKSHOP
%% Don’t be afraid as you delve into this new programming world. I'm here to help you.
%% Matlab Help
help sum
%helpwin, helpdesk, or helpbrowser
%F1
doc
%% MATLAB as a Calculator
6+5
5-3
6*5
5/3
5     +      3    
6+5-3*3+653/2-4
6+5*3
(6+5)*3
6^5
log(653)
exp(653)
sin(0)
sin(pi)
sin(3/2*pi)
%Note: Many of these operations are dependent on the desired accuracy.
log(653)
format long
log(653)
%As an exercise, try to “verify” numerically that x * y =? exp(log(x) + log(y)).
6*5
exp(log(6)+log(5))
%Hint: Keep track of the number of your parentheses.
2^653
6e5
6*10^5
ans+ans
% %Exercise 1.1: Try to find the numeric range of MATLAB. For which values of x in 2 ? x does
% MATLAB return a numeric value? For which values does it return infinity or negative infinity,
% Inf or -Inf, respectively?

%% Defining Matrice
% MATLAB (matrix laboratory)
[1 2 3]
[2 2 2; 3 3 3]
a = [1 2 3 4 5]
b = [6 7 8 9]
a
b
A
thismatrixcontainrealbrainsignals = [ 1 2 3 4 ]
thismatrixisreallyempty=[ ]
%% Some Special Variables
ans
beep
pi
eps
inf
NaN
i  (or)  j
realmin, realmax
bitmax
nargin, nargout
varargin
varaout

%% some commonly used matrices:
eye(6,5)
ones(6,5)
zeros(6,5)
rand(6,5)
randn(6,5)

x=23; y=57;
z = x + y
who
whos
save my_workspace x y z
save my_workspace
clear x
clear all
who
load my_workspace
size(a)
length(a)

%%%long vectors of incremental elements
thisiscool=4:18
thisiscool=4:2:18  %specifying the step size
%Two convenient functions for creating vectors
v1=linspace(6,5,3)
v2= logspace(1,5,5)
%Transposing a matrix or a vector
a
a'
% copy
b
b=a
a(2,1) = 9
%Exercise 1.2:
%Exercise 1.3:

%%%Call variable in matrix
X=[3 2 4 -10; 1 15 -2 9; -4 6 3 7]
X(2,3)
X(3,4)
X(4,1)
X(1,:)
X(:,2)
X(1,:)=23
X(:,1)=23
%presume you wanted to assign the value 57 to each entry of A that is equal
% or larger than 7 in the second row.
find(X(2,:)>= 7)
X(2,find(X(2,:) >= 7))=57
% For this example, it is clearer to split this operation into two lines:
i=find((X(:,4) >= 40)&(X(:,4)<60))
A(i,4)=7

A(3,2)=15
[r,c]=find(A==15)

%% Basic Matrix Algebra
p = [1 2; 3 4]
p = p + 2
q = [2 1; 1 1]
m = p + q
r= [2 1; 1 1; 1 1]
n = p + r
p*q
p.*q
a = [1 2 3 4 5]
b = [5 4 5 4 5]
c = a.*b
c = a*b
c = a.^2
A(3,2) = 5 + A(3,2);

c = a^2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%GRAPHICS AND VISUALIZATION%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
x = 0:10
y = sin(x)
plot(x,y)
x = 0:0.1:10;
y = sin(x);
plot(x,y)
hold on
z = cos(x);
plot(x,z,'color','k')
title('My trigonometric functions')
Hold off
Figure


results = [55 30 10 5]
bar(results)

h=bar(results)
set(h,'linewidth',3)
set(h,'FaceColor',[1 1 1])

h=bar(results)
get(h)
%set(h, 'Propertyname',Propertyvalue)
%% Histogram
sus=randn(100000,1);
figure
hist(sus,100)
doc hist

% loglog, semilogx, semilogy, stairs, and pie.

load chirp
plot(y)
sound(y)

%%% Box Plot

%Advanced Plotting
figure %Open a new figure
for i = 1:9 %Start loop, have counter i run from 1 to 9
subplot(3,3,i) %Draw into the subplot i, arranged in 3 rows, 3 columns
h = bar(1,1); %This is just going to fill the plot with a uniform color
set(h,'FaceColor',[0 0 i/9]); %Draw each in a slightly different color
end %End loop
%%% Fun: plot matlab logo
a = -2:0.2:2; %Creating a vector a with 21 elements
[x, y] = meshgrid(a, a); %Creating x and y as a meshgrid of a
z = exp (-x.^2 - y.^2); %Take the 2-dimensional exponential of x and y
figure %Open a new figure
subplot(1,2,1) %Create a left subplot
mesh(z) %Draw a wire mesh plot of the data in z
subplot(1,2,2) %Create a right subplot
surf(z) %Draw a surface plot of the data in z
%%%
%% Creating the MATLAB Logo
% This example shows how to create and display the MATLAB(R) logo.

% Copyright 2014 The MathWorks, Inc.

%%
% Use the |membrane| command to generate the surface data for the logo.

L = 160*membrane(1,100);

%%
% Create a figure and an axes to display the logo.  Then, create a surface
% for the logo using the points from the |membrane| command. Turn off the
% lines in the surface.

f = figure;
ax = axes;

s = surface(L);
s.EdgeColor = 'none';
view(3)

%%
% Adjust the axes limits so that the axes are tight around the logo.

ax.XLim = [1 201];
ax.YLim = [1 201];
ax.ZLim = [-53.4 160];


%%
% Adjust the view of the logo using the camera properties of the axes.
% Camera properties control the view of a three dimensional scene like a
% camera with a zoom lens.

ax.CameraPosition = [-145.5 -229.7 283.6];
ax.CameraTarget = [77.4 60.2 63.9];
ax.CameraUpVector = [0 0 1];
ax.CameraViewAngle = 36.7;

%%
% Change the position of the axes and the _x_, _y_, and _z_ aspect ratio to
% fill the extra space in the figure window.

ax.Position = [0 0 1 1];
ax.DataAspectRatio = [1 1 .9];

%%
% Create lights to illuminate the logo.  The light itself is not visible
% but its properties can be set to change the appearance of any patch or
% surface object in the axes.

l1 = light;
l1.Position = [160 400 80];
l1.Style = 'local';
l1.Color = [0 0.8 0.8];
 
l2 = light;
l2.Position = [.5 -1 .4];
l2.Color = [0.8 0.8 0];

%%
% Change the color of the logo.

s.FaceColor = [0.9 0.2 0.2];

%%
% Use the lighting and specular (reflectance) properties of the surface to
% control the lighting effects.

s.FaceLighting = 'gouraud';
s.AmbientStrength = 0.3;
s.DiffuseStrength = 0.6; 
s.BackFaceLighting = 'lit';

s.SpecularStrength = 1;
s.SpecularColorReflectance = 1;
s.SpecularExponent = 7;

%%
% Turn the axis off to see the final result.

axis off
f.Color = 'black';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Flow Control%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% if end
a=2
b=5
if a<b
    disp('a')
end
%%%
if a<b
    disp(a)
else 
    disp(b)
end

a=100
b=300
if a>b
    disp('Greater')
else if a<b
        disp('Less')
    else if a==b
            disp('Equal')
        end
    end
end

X=5*ones(3,3);
X.=[1 2 3 ; 4 5 6; 7 8 9]

%%Swich case 
input=1
switch input
    case -1
        disp('minus one')
case 0
        disp('Zero')
case 1
        disp('Plus one')
end
%%%For loop
for ii=1:100
    disp(ii^2)
end
%%% Add 10 sin wave with eachother to generate signal
for N = 1:10
X = X + N * sin (N*pi*t);
end
%%For loop Example
eegsignal=randn(33,25600);%%33 channel is eegdata
event=zeros(1,25600);
for ii=1:49,
    event(ii*512)=1;%tahrik
    event(ii*512+60+fix(rand*60))=2;%javabtahrik
end
eegsignal(34,:)=event;%% channel 34 is events
%%%While
a=2
b=5
while  ((a<30) & (b==5))
    a=a+1;	
end

%% DATA ANALYSIS
%Data import
 cd 'D:\EEG\Workshop\ESP\supply'
 %%%Open with Home>Data import
M1 = xlsread('data1.xlsx') %Importing data for Matrix I
M2 = xlsread('data2.xlsx') %Importing data for Matrix II

corrcoef(M1(1,:),M2(1,:)); %Correlation between Matrix I and Matrix II
averages1 = mean(M1(1,:)) %Take the average of the Movie matrix
averages2 = mean(M2(1,:)) %Take the average of the Movie matrix
max1=max(M1(1,:))
max2=max(M2(1,:))
bar ([max1,max2])
max11=max(M1(:,:))
max22=max(M2(:,:))
bar ([mean(max11),mean(max22)])
hold
errorbar ([mean(max11),mean(max22)],[std(max11),std(max22)],'ro')

%% Data structure 
%%%Cell
myCell = {1, 2, 3;
    'text', rand(5,10,2), {11; 22; 33}}
C = {}
%Access Data in a Cell Array
C = {'one', 'two', 'three';
     1, 2, 3};
upperLeft = C(1:2,1:2)
C(1,1:3) = {'first','second','third'}
numericCells = C(2,1:3)
numericVector = cell2mat(numericCells)
%Access the contents of cells
last = C{2,3}
C{1:2,1:2}
[r1c1, r2c1, r1c2, r2c2] = C{1:2,1:2}
%If each cell contains the same type of data, you can create a single variable by applying the array concatenation operator, [], to the comma-separated list. For example,
nums = [C{2,:}]


patient.name = 'John Doe';
patient.billing = 127.00;
patient.test = [79, 75, 73; 180, 178, 177.5; 220, 210, 205];
patient

patient(2).name = 'Ann Lane';
patient(2).billing = 28.50;
patient(2).test = [68, 70, 68; 118, 118, 119; 172, 170, 169];
patient

% Any unspecified fields for new structs in the array contain empty arrays.
patient(3).name = 'New Name';
patient(3)

%Access data in the structure array to find how much the first patient owes, and to create a bar graph of his test results.
amount_due = patient(1).billing
bar(patient(1).test)
title(['Test Results for ', patient(1).name])
%% % Real Data
load ('C:\Users\MJD\Dropbox\Matlab 4 Neuro\EEG')
EEG
Data=EEG.data;
plot(Data')
figure
for ii=1:5
    subplot(5,1,ii)
    plot((0:length(Data)-1)/128,Data(ii,:))
    xlabel('time(s)');ylabel('Amplitude');
    legend(sprintf('channel %d',ii));
    title(sprintf('channel %d',ii));
end


    


%% what is signal?
t=0:0.01:10
y= sin (2*pi*t)
plot(t,y)
%Amplitude Spectrum
L = 1000;
X = zeros(1,L);
sampling_interval=0.1;
t = (1:L) * sampling_interval;
for N = 1:10
X = X + N * sin (N*pi*t);
end
plot(t, X);
Y = fft(X)/L;%normalized FFT
%from 0 to  the Nyquist limit
NyLimit = (1 / sampling_interval)/ 2;
F = linspace(0,1,L/2)*NyLimit;
plot(F, abs(Y(1:L/2)));
%Power
plot(F, (Y(1:L/2).*conj(Y(1:L/2)));
%Phase Analysis and Coherence
L = 1000;
X = zeros(1,L);
sampling_interval=0.1;
t = (1:L) * sampling_interval;
for N = 1:10
X = X + N * sin (N*pi*t);
end
plot(t, X);
Y = fft(X)/L;
phi = atan(imag(Y)./real(Y));
F = linspace(0,1,L/2)*NyLimit;
plot(F, phi(1:L/2));
% correction
Y2=Y;
threshold=max(abs(Y))/1000;
Y2(abs(Y)<threshold)=0;
phi = atan(imag(Y2)./real(Y2)).*180/pi;
F = linspace(0,1,L/2)*NyLimit;
plot(F, phi(1:L/2),'*');
%% short-time Fourier transform (STFT)
L = 100;
w = hamming(L);
plot(1:L, w)

cd 'D:\EEG\Workshop\ESP\supply'
[amp, fs ]= audioread('song1.wav');
spectrogram(amp, 256, 'yaxis')
spectrogram(amp, 256, [ ], [ ], fs, 'yaxis')
[S, F, T, P] = spectrogram(amp);
%% Entertain with the STFT
t = 0:0.001:2;
x = chirp(t,1,1,100,'quadratic');
spectrogram(x,128,120,128,1e3)
%%
function [ output ] = derivative( sig )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

output= diff(sig);

end
