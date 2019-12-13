load('Data1.mat');

plot(data(1,:)); xlabel('sample'); ylabel('magnitude');
title('channel1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2-plot as second not sample

figure;plot((0:length(data)-1)/128,data(1,:));xlabel('time(s)');
ylabel('magnitude');
title('channel1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3-plot 2 channel with 15Sec
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% epoch in one figure

figure;plot((0:length(data)-1)/128,data(1,:),(0:length(data)-1)/128,data(2,:));
xlim([0 15]);xlabel('time(s)');ylabel('magnitude');
legend('CH1', 'CH2');
title('channel 1 & 2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4-plot 2 chanel in subplot

subplot(2,1,1);
plot((0:length(data)-1)/128,data(1,:));
xlim([0 15]);xlabel('time(s)');ylabel('magnitude');title('channel1');
subplot(2,1,2);
plot((0:length(data)-1)/128,data(2,:));
xlim([0 15]);xlabel('time(s)');ylabel('magnitude');title('channel2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 5-plot channel 1 in subplot

jj = [0;50;100;150;200;(length(data)-1)/128];
for ii=1:5
    subplot(5,1,ii);
    plot((0:length(data)-1)/128,data(1,:));
    xlim([jj(ii) jj(ii+1)]);
    ylim([-500 500]);
end 
xlabel('time(s)');
ylabel('magnitude');
   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 6-plot channel 2 in subplot

figure;
jj = [0;50;100;150;200;(length(data)-1)/128];
for ii=1:5
    subplot(5,1,ii);
    plot((0:length(data)-1)/128,data(2,:));
    xlim([jj(ii) jj(ii+1)]);
    ylim([-500 500]);
end
xlabel('time(s)');
ylabel('magnitude');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 7-extracting events

for ii=1:size(event,2)
   events(ii) = event(1,ii).latency/128;
   stem(events);
end
xlabel('sample');
ylabel('latency');
title('events');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 8-extracting events based on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% types

square_events = zeros (1,size(event,2));
rt_events = zeros (1,size(event,2));

for ii=1:size(event,2)
    if strcmp(event(1,ii).type ,'square')
        square_events(ii) = event(1,ii).latency/128;
    else
        rt_events(ii) = event(1,ii).latency/128; 
    end
end
subplot(3,1,1);stem(square_events);xlabel('sample');ylabel('latency');
title('square events');

subplot(3,1,2);stem(rt_events);xlabel('sample');ylabel('latency');
title('rt events');

y = [square_events ;rt_events];
subplot(3,1,3);stem(y');xlabel('sample');ylabel('latency');
title('full events');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 9-extracting events function

function [ square_events, rt_events ] = EventExtaractor( event )
    square_events = zeros (1,size(event,2));
    rt_events = zeros (1,size(event,2));

    for ii=1:size(event,2)
        if strcmp(event(1,ii).type ,'square')
            square_events(ii) = event(1,ii).latency/128;
        else
            rt_events(ii) = event(1,ii).latency/128; 
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10-ploting channel 1 and
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% drawing events
[ square_events, rt_events ] = EventExtaractor( event );

figure;plot((0:length(data)-1)/128,data(1,:));
hold all;
SQ_NZ = nonzeros(square_events)';
for ii=1:size(SQ_NZ,2)
    hold all;
    plot([SQ_NZ(1,ii),SQ_NZ(1,ii)],[-600,600],'r')
end
hold all;
RT_NZ = nonzeros(rt_events)';
for ii=1:size(RT_NZ,2)
    hold all;
    plot([RT_NZ(1,ii),RT_NZ(1,ii)],[-600,600],'g')
end
xlabel('time(s)');ylabel('magnitude');
title('channel 1 with events - red: square, green:rt');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 11-ploting channel 1 and
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% drawing subplot

[ square_events, rt_events ] = EventExtaractor( event );
jj = [0;50;100;150;200;(length(data)-1)/128];
for ii=1:5
    subplot(5,1,ii);
    plot((0:length(data)-1)/128,data(1,:));
    xlim([jj(ii) jj(ii+1)]);
    ylim([-500 500]);
    hold all;
    SQ_NZ = nonzeros(square_events)';
    for kk=1:size(SQ_NZ,2)
        hold all;
        plot([SQ_NZ(1,kk),SQ_NZ(1,kk)],[-600,600],'r')
    end
    hold all;
    RT_NZ = nonzeros(rt_events)';
    for kk=1:size(RT_NZ,2)
        hold all;
        plot([RT_NZ(1,kk),RT_NZ(1,kk)],[-600,600],'g')
    end
end
xlabel('time(s)');ylabel('magnitude');
title('channel 1 with events - red: square, green:rt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 12- fft

x = data(1,:);
Fs = 128;                    		% Sampling frequency
T = 1/Fs;                     		% Sample time
L = length(x);                      % Length of signal
t = (0:L-1)*T;                
nfft = 2^( nextpow2(length(x)) );
df = Fs/nfft;
f = 0:df:Fs/2;
X = fft(x,nfft);
X = X(1:nfft/2+1);
figure; plot(f,abs(X)); axis([0,64,0,10e4]); % plot freq domain
xlabel('ferquency(hz)');ylabel('magnitude');
title('channel 1 frequncy response');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 13- stft

x = data(1,:);
Fs = 128;                    		% Sampling frequency
T = 1/Fs;                     		% Sample time
L = length(x);                      % Length of signal
t = (0:L-1)*T;                
figure; spectrogram(double(x), 1000,[],[],Fs , 'yaxis');
title('channel 1 STFT');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 14- Notch filter

x = data(1,:);
Fs = 128;                    		% Sampling frequency
T = 1/Fs;                     		% Sample time
L = length(x);                      % Length of signal
t = (0:L-1)*T;
h = fdesign.notch('N,F0,Q',2,60,10,Fs);
d = design(h);
y = filtfilt(d.sosMatrix,d.ScaleValues,double(x));   %zero-phase filtering
figure; subplot(2,2,2); spectrogram(double(y), 1000,[],[],Fs , 'yaxis');
title('channel 1 notch filter STFT');
subplot(2,2,1); spectrogram(double(x), 1000,[],[],Fs , 'yaxis');
title('channel 1 STFT');

nfft = 2^( nextpow2(length(x)) );
df = Fs/nfft;
f = 0:df:Fs/2;
X = fft(x,nfft);
X = X(1:nfft/2+1);
subplot(2,2,3);plot(f,abs(X)); axis([0,64,0,10e4]); % plot freq domain
xlabel('ferquency(hz)');ylabel('magnitude');
title('channel 1 frequncy response');
x = y;
nfft = 2^( nextpow2(length(x)) );
df = Fs/nfft;
f = 0:df:Fs/2;
X = fft(x,nfft);
X = X(1:nfft/2+1);
subplot(2,2,4);plot(f,abs(X)); axis([0,64,0,10e4]); % plot freq domain
xlabel('ferquency(hz)');ylabel('magnitude');
title('channel 1 notch filter frequncy response');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 15-creating epochs function

function [ epochs, SQ, RT, ReactionTime ] = EpochExtaractor( event )

    for ii=1:size(event,2)-1
        if strcmp(event(1,ii).type ,'square')
            if strcmp(event(1,ii+1).type ,'rt')
             epochs(ii) = int64(event(1,ii).latency);
             SQ(ii) = event(1,ii).latency;
             RT(ii) = event(1,ii+1).latency;
             ReactionTime(ii) = event(1,ii+1).latency - event(1,ii).latency;
            end
        end
    end
    epochs = nonzeros(epochs)';
    SQ = nonzeros(SQ)';
    RT = nonzeros(RT)';
    ReactionTime = nonzeros(ReactionTime)';
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 16-extracting epochs

[ epochs, SQ, RT, ReactionTime ] = EpochExtaractor( event );

for ii = 1:size(epochs,2)
    EpochData(1,ii).data = data(1,epochs(ii)-12:epochs(ii)+128);
    EpochData(1,ii).SQ = 12;
    EpochData(1,ii).RT = ReactionTime(ii);
end

for ii=1:size(EpochData,2)
    subplot(9,9,ii);
    plot((0:length(EpochData(1,ii).data)-1)/128,EpochData(1,ii).data);
    hold all;
    plot([EpochData(1,ii).SQ/128,EpochData(1,ii).SQ/128],[-50,50],'r');
    hold all;
    plot([EpochData(1,ii).RT/128,EpochData(1,ii).RT/128],[-50,50],'g');
end
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 17-epochs bandpower

[ epochs, SQ, RT, ReactionTime ] = EpochExtaractor( event );

for ii = 1:size(epochs,2)
    EpochData(1,ii).data = data(1,epochs(ii)-12:epochs(ii)+128);
    EpochData(1,ii).SQ = 12;
    EpochData(1,ii).RT = ReactionTime(ii);
end

DeltaBand = bandpower(EpochData(1,1).data,128,[0 4]);
ThetaBand = bandpower(EpochData(1,1).data,128,[5 7]);
AlphaBand = bandpower(EpochData(1,1).data,128,[8 13]);
BetaBand = bandpower(EpochData(1,1).data,128,[14 20]);
ptot = bandpower(EpochData(1,1).data,128,[0 50]);
Delta_power = 100*(DeltaBand/ptot)
Theta_power = 100*(ThetaBand/ptot)
Alpha_power = 100*(AlphaBand/ptot)
Beta_power = 100*(BetaBand/ptot)






