clc;
close all;
clear;

%intrest rat

int_rate=0.04;

total=1+int_rate;

A=total;
%Zero controll
B=0;
%Make y=x
C=1;
%Zero output controll
D=0;

%Start capital
Start=10000;

all_caps=zeros(10);
names=repmat("Rate=",[1,10]);
for i=1:10
    cap_rate=1/i;
    h=cap_rate;
    sim('model');
    plot(tout,x);
    hold on;
    names(i)=names(i)+num2str(cap_rate);
    
end
title({'Bank balance',['Starting with=',num2str(Start)], ['Intrest Rate=' , num2str(int_rate),'%' ] });
legend(names);


