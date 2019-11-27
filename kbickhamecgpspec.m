%% Kris Bickham Midterm Programming Exam
%% EEG Power Spectrum
%% 10/12/17
%% On 3rd sublot I just wanted to zoom; The non integer values are super bad - I realize 
%% stating last element, but this is the immediete case solution.

Amp = xlsread('EEGData.xlsx','B1:B769')
Time =  xlsread('EEGData.xlsx','A1:A769')

Amp = Amp/1000000 %% convert to micro volts




N = length(Amp); %number of datapoints
Ampw = Amp.* hamming(N); 
ts = Time(2)-Time(1) % find time inbetween, don't ask me why i picked these
fs = 1/ts  %sampliNGn frequency; NOT SURE if non inter val will screw this up
ttotal = (N-1)*ts; %total time of signal
df = fs/N; %frequency resolution

jw = (0:1:N/2)*df; % create alternate frequency dimension of goodness
t = (0:ts:ttotal); % create space time, This sadly took me a while to realize using a '1' for the increment will super screw program up
zoom = (0:1:N/6)*df; % axis for 3rd zoomed plot , to identify features of waveforms

X = abs(fft(Ampw))/N; % I did this wrong so many times
X = 2*X; % Double>Single spectrum: Stealing back the stolen magnitude from the ghostifacts
X(1) = X(1)/2; % Fix the value at 0hz
X = X.^2; %Power is squared fam, element wise

     

subplot(3,1,1);
plot(t,Ampw);
title('Time Domain Signal')
xlabel('Time (sec.)');
ylabel('ECG signal (V)');

subplot(3,1,2);
plot(jw,X(1:(N/2)+1));
title('Frequency Domain Analysis, (Hamming + FFT)')
xlabel('Frequency (Hz)'); 
ylabel('Power (W)');


subplot(3,1,3);
plot(zoom,X(1:(N/6)+1)); %(1:N/2+1));
title('Frequency Domain Zoom, (Hamming + FFT)')
xlabel('Frequency (Hz)'); 
ylabel('Power (W)');
 
 



 
