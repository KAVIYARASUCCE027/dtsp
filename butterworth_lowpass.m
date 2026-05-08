clc;
close all;
clear all;

pkg load signal

format long

rp=input('Enter the passband ripple (rp)= ');
rs=input('Enter the stopband ripple (rs)= ');
wp=input('Enter the passband frequency (wp)= ');
ws=input('Enter the stopband frequency (ws)= ');
fs=input('Enter the sampling frequency (fs)= ');

w1=2*wp/fs;
w2=2*ws/fs;

[n,wn]=buttord(w1,w2,rp,rs);

disp('Filter order = ');
disp(n);

disp('Cutoff frequency = ');
disp(wn);

[b,a]=butter(n,wn);

disp('b = ');
disp(b);

disp('a = ');
disp(a);

w=0:0.01:pi;

[h,om]=freqz(b,a,w);

m=20*log10(abs(h));

an=angle(h);

subplot(2,1,1);
plot(om/pi,m);
ylabel('Gain in dB -->');
xlabel('Normalized frequency -->');
title('Magnitude Response');

subplot(2,1,2);
plot(om/pi,an);
xlabel('Normalized frequency -->');
ylabel('Phase in radians -->');
title('Phase Response');
