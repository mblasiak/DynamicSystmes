%Clear all left overs
clc;
close all;
clear;

%Set system parameters
%Nominator Dominator
N=[0 1];
D=[1 1 2];
roots(D)
%Create Systme
system=tf(N,D);

figure;
%Show nyquist characteristic
nyquist(system);
hold on;
%Print empty point in (-1,0) so stabillity can be easilly deterimned
%matlab will show plot including this point
plot(-1,0,'');


%Same with the second system

N=[1 0];
D=[1 -0.1 2];
roots(D)
system=tf(N,D);

figure;
nyquist(system);
hold on;
plot(-1,0,'');

%Detrimne stabillity of closed system by chkecking nyquist stabillity
%when the system is open (has no feedback loop)