clc;
close all;
clear;
%Parameters with _c are used in continues State Space
%Setting state equation
%A is state matrix of our system and B is matrix of controll
A=[1,1;1,1];
A_c=A;
%B=0 means system is autonomous
B=[0;0];
B_c=B;
%Seting what y equals to
%Using eye for C and [0 0] for D
%We make [y1,y2]=[x1,x2]
C=eye(2);
C_c=C;
%We dont have controll of the outpus so D=0
D=[0;0];
D_c=D;

%Sampling time (Time between taking samples
%from analog input and transforming to discrate signal 
h=1e-2;


%Start state of system
Start=0;
Start_c=Start;

%Tesi is everyting working
sim('model_2');
plot(tout,x);

%%
%Task 2

%My I N dependent on lengt of name and surename
I=length('Milosz');
N=length('Blasiak');

%Applaying vaules to matrixes
A_c=[0 1;-I -N];
B_c=[0;1];
C_c=[1 0; 0 1];
D_c=[0;0];

h=1;

%Using equation given in file
A=expm(h*A_c);
%Define that z is symbolic
syms z;
%Int=Integral function in matlab from 0 to h using z(t) 
%Cast intergration on double becouse function will return synbloic result
B=double(int(expm(z*A_c)*B_c,z,0,h));
C=C_c; 
D=D_c;

Start=5;
Start_c=Start;
sim('model_2');


%CAŁY CZAS

figure(2);
subplot(1,2,1);
plot(tout,x(:,1),'red');
hold on;
plot(tout,x(:,3),'blue');
title("Discrete-Continues x1(t),");
legend('Continues','Discrete');
xlabel("time t");
ylabel("x1(t)");



subplot(1,2,2);
plot(tout,x(:,2),'red');
hold on;
plot(tout,x(:,4),'blue');

title("Discrete-Continues x2(t)");
legend('Continues','Discrete');
xlabel("time t");
ylabel("x2(t)");

