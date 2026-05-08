clear all;
clc;
close all;

pkg load signal

format long

rp=input('Enter the pass band ripple: ');
rs=input('Enter the stop band ripple: ');

wp=input('Enter the pass band frequencies [wp1 wp2]: ');
ws=input('Enter the stop band frequencies [ws1 ws2]: ');

fs=input('Enter the sampling frequency: ');

% Normalize frequencies
w1 = 2*wp/fs;
w2 = 2*ws/fs;

% Find filter order
[n,wn] = cheb1ord(w1,w2,rp,rs);

disp('Filter order = ');
disp(n);

disp('Cutoff frequencies = ');
disp(wn);

% Chebyshev Type-1 Bandpass Filter
[b,a] = cheby1(n,rp,wn);

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
% Pole-zero plot
figure(2);
zplane(b,a);

title('Pole-Zero Plot');

% Frequency response
 % figure(1);
%freqz(b,a);

%title('Chebyshev Bandpass Filter');
