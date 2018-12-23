clc;
close all;
clear;

step_size=0.001;

%intrest rate
int_rate=0.04;

total_intrest=1+int_rate;

A=total_intrest;
%Zero controll infuleance
B=0;
%Make y=x 
C=1;
%Zero output controll influance
D=0;

%Starting balance
Start=10000;

%Set rates to test
rates=[1, 0.5,0.4, 0.3 , 0.2 ];

numb_of_rates=length(rates);
%Calulate change of bank balance for every single rate
names=repmat("Rate=",[1,length(rates)]);
for i=1:numb_of_rates
    cap_rate=rates(i);
    h=cap_rate;
    
    sim('bank_model');
    plot(tout,x);
    hold on;
    names(i)=names(i)+num2str(cap_rate);
    
end
title({'Bank balance',['Starting with=',num2str(Start)], ['Intrest Rate=' , num2str(int_rate),'%' ] });
legend(names);
xlabel('Time');
ylabel('Account Balance');


