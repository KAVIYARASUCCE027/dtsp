clear all;
clc;
close all;

pkg load signal

disp('Design of FIR Filters using Hamming Window');

n=input('Enter number of samples = ');
w=input('Enter cutoff frequency = ');

n=n-1;

% LOW PASS FILTER
lpf=fir1(n,w/pi,hamming(n+1));

[h,w1]=freqz(lpf,1,256);

m=20*log10(abs(h));

subplot(2,2,1);
plot(w1/pi,m);
ylabel('Gain in dB');
xlabel('Normalized Frequency');
title('LPF using Hamming Window');

% HIGH PASS FILTER
hpf=fir1(n,w/pi,'high',hamming(n+1));

[h1,w2]=freqz(hpf,1,256);

m1=20*log10(abs(h1));

subplot(2,2,2);
plot(w2/pi,m1);
ylabel('Gain in dB');
xlabel('Normalized Frequency');
title('HPF using Hamming Window');

% BAND PASS FILTER
wc1=input('Enter first cutoff frequency = ');
wc2=input('Enter second cutoff frequency = ');

wn=[wc1 wc2];

bpf=fir1(n,wn/pi,'bandpass',hamming(n+1));

[h2,w3]=freqz(bpf,1,256);

m2=20*log10(abs(h2));

subplot(2,2,3);
plot(w3/pi,m2);
ylabel('Gain in dB');
xlabel('Normalized Frequency');
title('BPF using Hamming Window');

% BAND STOP FILTER
wc3=input('Enter first cutoff frequency = ');
wc4=input('Enter second cutoff frequency = ');

wn1=[wc3 wc4];

bsf=fir1(n,wn1/pi,'stop',hamming(n+1));

[h3,w4]=freqz(bsf,1,256);

m3=20*log10(abs(h3));

subplot(2,2,4);
plot(w4/pi,m3);
ylabel('Gain in dB');
xlabel('Normalized Frequency');
title('BSF using Hamming Window');
