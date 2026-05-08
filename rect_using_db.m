clear all;
clc;
close all;

pkg load signal

% Specifications
fs = 2000;          % Sampling frequency

fp1 = 100;          % Lower passband frequency
fp2 = 300;          % Upper passband frequency

fs1 = 500;          % Lower stopband frequency
fs2 = 650;          % Upper stopband frequency

n = 20;             % Filter order

% Normalized frequencies
wp = [fp1 fp2]/(fs/2);
ws = [fs1 fs2]/(fs/2);

%% FIR BAND PASS FILTER
bpf = fir1(n,wp,'bandpass',rectwin(n+1));

figure(1);

freqz(bpf,1);

title('FIR Band Pass Filter using Rectangular Window');

figure(2);

zplane(bpf,1);

title('Pole-Zero Plot of BPF');

%% FIR BAND STOP FILTER
bsf = fir1(n,ws,'stop',rectwin(n+1));

figure(3);

freqz(bsf,1);

title('FIR Band Stop Filter using Rectangular Window');

figure(4);

zplane(bsf,1);

title('Pole-Zero Plot of BSF');
