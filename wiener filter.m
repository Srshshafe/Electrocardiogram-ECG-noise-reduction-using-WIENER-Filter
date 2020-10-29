clear all 
clc
close all
y=wgn(500,1,2);
subplot(5,1,1)
plot(y)
title('white NOISE')
num=[0.028  0.053 0.071  0.053 0.028];
den=[1.000 -2.026 2.148 -1.159 0.279];
n1=filter(num,den,y);
EcgData=1*ecg(500);
o=(EcgData'+.2*n1);
subplot(5,1,2)
plot(EcgData)
title('ECG')
ax(1)=subplot(5,1,3);
plot(n1)
title('colorful NOISE')
ax(3)=subplot(5,1,4);
plot(o)
title('ECG+NOISE')
z=EcgData;
s=mean(o*o');
d=mean(o*z);
ww=fft(s,2048);
aa=fft(d,2048);
W=aa./ww;
e=ifft(W);
n=conv(o,e);
ax(4)=subplot(5,1,5);
plot(n)
title('ECGg')