%ANIRUDH KANNAN V P
%201601004
%CSE BATCH A
clc;
clear all;
close all;

msgfreq=0.2;
ampmsg=2;
wid=0.1;
tvec=0:0.01:10;
wm=2*pi*msgfreq;


lengtht=length(tvec);
plssignal=zeros(1,lengtht);
msgsignal=ampmsg*sin(2*pi*msgfreq*tvec);

i=0;
st=1;
while i<=10
    plssignal(msgfreq<= tvec-i & tvec-i <=wid+msgfreq)=1;
    i = i + 0.4;
end

%PWM
newwidth=wid*(1+msgsignal);

PWMsignal=zeros(1,lengtht);

i=0;
st=1;
while i<=10
    PWMsignal(0<= tvec-i & tvec-i <=newwidth+wid)=1;
    i = i + 0.4;
end

subplot(3,1,1);
plot(tvec,plssignal);
xlabel('TIME (PULSE TRAIN)');
ylabel('AMPLITUDE');
ylim([-2,2]);
subplot(3,1,2);
plot(tvec,msgsignal);
xlabel('TIME (SIGNAL)');
ylabel('AMPLITUDE');
subplot(3,1,3);
plot(tvec,PWMsignal);
xlabel('TIME (PWM)');
ylabel('AMPLITUDE');
ylim([-2,2]);