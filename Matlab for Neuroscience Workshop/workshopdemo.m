%EEG Workshop
%Frequency reperesentation
%Ali Motie Nasrabadi
% FFT of cosine function with F=100Hz
Fs=1000; %Frequency sampling
t=0:1/Fs:0.2-1/Fs; %sampled Time, Duration T=0.2 sec , Number of Time sample: Ns=T*Fs=200
x=cos(2*pi*t*100)+randn(size(t)); % signal + noise 
figure(1);plot(t,x)
xlabel('time (sec)')
title(' x signal with 100Hz')
fx=fft(x);
figure(2);plot(abs(fx))
xlabel('freq-sample')
title(' FFT of x signal')
ylabel(' Absolute of power')
figure(3);plot(10*log10(abs(fx)))
xlabel('freq-sample')
title(' FFT of x signal')
ylabel(' Log10 of Absolute power')
%frequency resolution is df=1/T=5 Hz
f=(0:99)/99*Fs/2; %Ns/2 is equal to Fs/2
figure(4);plot(f,abs(fx(1:100)))
xlabel('freq (Hz)')
title(' FFT of x signal')
ylabel(' Absolute of power')

%Frequency resolution example 1
% two Sinusiod functions with F1=100 Hz and F2=200 Hz 
% df=5Hz therefore two cosines can be detected
x=cos(2*pi*t*100)+cos(2*pi*t*200)+randn(size(t)); % signal + noise 
figure(5);plot(t,x)
xlabel('time (sec)')
title(' x signal with 100Hz and 200Hz')
fx=fft(x);
figure(6);plot(f,abs(fx(1:100)))
xlabel('freq (Hz)')
title(' FFT of x signal with 100 and 200 Hz')
ylabel(' Absolute of power')

%Frequency resolution example 2
% two Sinusiod functions with F1=100 Hz and F2=102 Hz 
% df=5Hz therefore two cosine can not be detected
x=cos(2*pi*t*100)+cos(2*pi*t*102)+randn(size(t)); % signal + noise 
figure(7);plot(t,x)
xlabel('time (sec)')
title(' x signal with 100Hz and 102Hz')
fx=fft(x);
figure(8);plot(f,abs(fx(1:100)))
xlabel('freq (Hz)')
title(' FFT of x signal with 100 and 102 Hz')
ylabel(' Absolute of power')

% EXAMPLE of pwelch:
       Fs = 1000;   t = 0:1/Fs:.296;
       x = cos(2*pi*t*200)+randn(size(t));  % A cosine of 200Hz plus noise
       pwelch(x,[],[],[],Fs,'twosided'); % Uses default window, overlap & NFFT. 
  
% EXAMPLE: Spectral analysis of a signal that contains a 200Hz cosine
             % plus noise.
             Fs = 1000;   t = 0:1/Fs:.296;
             x = cos(2*pi*t*200)+randn(size(t));  
             h = spectrum.welch;    % Create a Welch spectral estimator. 
 
             Hpsd = psd(h,x,'Fs',Fs);             % Calculate the PSD 
             plot(Hpsd)   % Plot the PSD.
             
             
             
 % EXAMPLE 1: Display the PSD of each segment of a quadratic chirp.
      t=0:0.001:2;                    % 2 secs @ 1kHz sample rate
      y=chirp(t,100,1,200,'q');       % Start @ 100Hz, cross 200Hz at t=1sec 
      spectrogram(y,128,120,128,1E3,'yaxis'); % Display the spectrogram
      title('Quadratic Chirp: start at 100Hz and cross 200Hz at t=1sec');
 
  %  EXAMPLE 2: Display the PSD of each segment of a linear chirp.
      t=0:0.001:2;                    % 2 secs @ 1kHz sample rate
      x=chirp(t,0,1,150);             % Start @ DC, cross 150Hz at t=1sec 
      F = 0:.1:500;
      [y,f,t,p] = spectrogram(x,256,250,F,1E3,'yaxis'); 
      % NOTE: This is the same as calling spectrogram with no outputs.
      surf(t,f,10*log10(abs(p)),'EdgeColor','none');   
      axis xy; axis tight; colormap(jet); view(0,90);
      xlabel('Time');
      ylabel('Frequency (Hz)');
      
      
  % Wavelet decomposion 
       t=0:0.001:2; % 2 secs @ 1kHz sample rate
       y=chirp(t,100,1,200,'q');       % Start @ 100Hz, cross 200Hz at t=1sec 
       figure;plot(t,y)
       [C,L]=wavedec(y,8,'db5');
       C1=C;
       C1(1,(end-L(end-1))+1:end)=zeros(1,L(end-1));
       y1=waverec(C1,L,'db5');
       figure;plot(t,y1)
 

