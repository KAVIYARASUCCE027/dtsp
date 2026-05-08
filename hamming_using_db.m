clear all;
clc;
close all;

pkg load signal

% Specifications
fc = 800;      % Cutoff frequency
fs = 4000;     % Sampling frequency

n = 20;        % Filter order

% Normalized cutoff frequency
wn = fc/(fs/2);

% FIR High Pass Filter using Blackman Window
b = fir1(n,wn,'high',hamming(n+1));

disp('Filter coefficients = ');
disp(b);

% Magnitude response
figure(1);

freqz(b,1);

title('FIR High Pass Filter using Blackman Window');

% Pole-zero plot
figure(2);

zplane(b,1);

title('Pole-Zero Plot');
