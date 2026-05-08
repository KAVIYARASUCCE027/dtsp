clc;
x=input('enter 1st seq: ');
h=input('enter 2nd seq: ');
y=conv(x,h);
figure;
subplot(3,1,1);
stem(x);
ylabel('amplitude');
xlabel('a n --->');
title('Input Sequence');
subplot(3,1,2);
stem(h);
ylabel('amplitude');
xlabel('b n --->');
title('Impulse Sequence');

subplot(3,1,3);
stem(y);
ylabel('amplitude');
xlabel('c n --->');
title('Linear Convolution Output');

disp('The result is:');
disp(y);
