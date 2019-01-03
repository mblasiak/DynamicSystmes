%Clear all left overs
clc;
close all;
clear;

%Set model parameters
%Sin frequnecy and Ampitude
f=0.9;
A=30;

%Diffrent Values to examine

%Set Transmitatio of the model  T=(L/M)
L=[3 3];
M=[1 2 21];

%Simulatee
sim('model');

%Plot Control and State on the same graph
figure;
plot(tout,out(:,1));
hold on;
plot(tout,out(:,2));
hold on;
xlabel('time');
ylabel('value');
legend('Control','State')