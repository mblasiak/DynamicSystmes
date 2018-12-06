clc;
close all;
clear;

%Set up


%Itegrator
WPC=4;

%Calculate K
R=10;
C=0.1;
K=1/(R*C);


%Step
s1=0;
s2=1;
ts=4;

%Sinwave
A=1;
f=10;
%%
sim("model");
plot(tout,x);

%%
%Autonomic system

%If step=0 all the time, there is no external influeance in the system
s1=0;
s2=0;


%Model Parameters
R=10;
C=0.1;
K=1/(R*C);
WPC=5;


sim('model');
plot(tout,x);


