clc;
close all;
clear all;

pkg load signal

format long

rp=input('Enter the passband ripple (rp)= ');
rs=input('Enter the stopband ripple (rs)= ');

wp=input('Enter the passband frequencies [wp1 wp2]= ');
ws=input('Enter the stopband frequencies [ws1 ws2]= ');

fs=input('Enter the sampling frequency (fs)= ');

% Normalize frequencies
w1=2*wp/fs;
w2=2*ws/fs;

% Find filter order
[n,wn]=buttord(w1,w2,rp,rs);

disp('Filter order = ');
disp(n);

disp('Cutoff frequency = ');
disp(wn);

% Design Butterworth Bandpass Filter
[b,a]=butter(n,wn,'bandpass');

disp('b = ');
disp(b);

disp('a = ');
disp(a);

% Frequency response
w=0:0.01:pi;

[h,om]=freqz(b,a,w);

m=20*log10(abs(h));
an=angle(h);

figure(1);

subplot(2,1,1);
plot(om/pi,m);
ylabel('Gain in dB');
xlabel('Normalized frequency');
title('Magnitude Plot (BPF)');

subplot(2,1,2);
plot(om/pi,an);
xlabel('Normalized frequency');
ylabel('Phase angle in radians');
title('Phase Plot (BPF)');
