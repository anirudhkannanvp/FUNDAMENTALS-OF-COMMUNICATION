%ANIRUDH KANNAN V P
%201601004
%CSE BATCH A

clc;
clear all;
close all;

msgfreq=1;
ampmsg=20;
wid=1;
tvec=0:0.1:100;
wm=2*pi*msgfreq;


lengtht=length(tvec);
plssignal=zeros(1,lengtht);
msgsignal=ampmsg*sin(2*pi*msgfreq*tvec);

i=0;
st=1;
while i<=100
    plssignal(msgfreq<= tvec-i & tvec-i <=wid+msgfreq)=1;
    i = i + 4;
end

%PWM
newwidth=wid*(1+msgsignal);

PWMsignal=zeros(1,lengtht);

i=0;
st=1;
while i<=100
    PWMsignal(0<= tvec-i & tvec-i <=newwidth+wid)=1;
    i = i + 4;
end


%GENERATING PPM FROM PWM
PPMsignal=ones(1,lengtht);

i=0;
st=1;
while i<=100
    PPMsignal(0<= tvec-i & tvec-i <=newwidth+wid)=0;
    i = i + 4;
end

start=1;
endt=1;

i=1;
lengtht=100;
while i<lengtht
    if(PPMsignal(i)==1)
        start=i;
        j=start;
        while j<lengtht
            if(PPMsignal(j)==0)
                endt=j-1 ;
                break
            end
            j = j + 1;
        end
    end
    PPMsignal(tvec>=start+0.8 & tvec<=endt)=0;
    i = i + 1;
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
ylim([-2,2]);
subplot(3,1,3);
plot(tvec,PPMsignal);
xlabel('TIME (PPM)');
ylabel('AMPLITUDE');
ylim([-2,2]);