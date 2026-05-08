clc;
clear all;

% Fast Fourier Transform
disp('Fast Fourier Transform');

l=input('Enter the length: ');
x=input('Enter the input sequence: ');

y=fft(x,l);

disp('Resultant FFT sequence:');
disp(y);

figure(1);

subplot(2,2,1);
stem(x);
title('Input Sequence');
xlabel('n -->');
ylabel('x(n)');

subplot(2,2,2);
stem(y);
title('FFT Sequence');
xlabel('Frequency');
ylabel('|X(k)|');

% Inverse Fast Fourier Transform
disp('Inverse Fast Fourier Transform');

x1=input('Enter the FFT sequence: ');

y1=ifft(x1);

disp('Resultant IFFT sequence:');
disp(y1);

subplot(2,2,3);
stem(x1);
title('FFT Input');
xlabel('Frequency');
ylabel('|X(k)|');

subplot(2,2,4);
stem(y1);
title('IFFT Sequence');
xlabel('n -->');
ylabel('x(n)');

% Continuous Frequency Response Graphs
figure(2);
freqz(y);
title('FFT Frequency Response');

figure(3);
freqz(y1);
title('IFFT Frequency Response');
