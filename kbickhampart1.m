%write down what you know first
N = 1000; % 2 seconds
fs = 500;

%construct a frequency axis
%find sampling interval, total time, 

ts = 1/fs
ttotal = (N-1)*ts
df = fs/N

%amplitude 
fa = (0:1:N-1)*df;
t = 0:ts:ttotal;

%discreet function
x = 3.5*sin(2*pi*200*t) %frequency domain function
X = abs(fft(x));
X = (1/N^2) * X.^2 

% /N;
% X = X.^2;

X2 = fftshift(X); %shifts array so we can center it; or the axis will be wrong
fshift = (-N/2:1:N/2-1)*df %have to subtract the last point (n/2)-1 , fixes axis
figure(2);
plot(fshift,X2);
title('Power Spectrum: |3.5| * Sin ( 2 * pi * 200 * t)')
xlabel('Frequency (jw)');
ylabel('ECG signal (V)');


