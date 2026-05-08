clear all;
clc;
close all;

pkg load signal

rp=input('Enter the pass band ripple: ');
rs=input('Enter the stop band ripple: ');

wp=input('Enter the pass band frequencies [wp1 wp2]: ');
ws=input('Enter the stop band frequencies [ws1 ws2]: ');

fs=input('Enter the sampling frequency: ');

% Normalize frequencies
w1=2*wp/fs;
w2=2*ws/fs;

% Filter order and cutoff
[n,wn]=cheb1ord(w1,w2,rp,rs);

% Chebyshev Type-1 Bandpass Filter
[b,a]=cheby1(n,rp,wn);

disp('Filter order');
disp(n);

disp('Cut-off frequencies');
disp(wn);

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
ylabel('Gain in dB --->');
xlabel('Normalized frequency --->');
title('Chebyshev Type-1 Band Pass Filter');

subplot(2,1,2);
plot(om/pi,an);
xlabel('Normalized frequency --->');
ylabel('Phase in radians --->');
title('Phase Response');
