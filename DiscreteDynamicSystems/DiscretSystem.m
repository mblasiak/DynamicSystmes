clc;
close all;
clear;
%Setting state equation
%A is state matrix of our system and B is matrix of controll
A=[1,1;1,1];
%B=0 means system is autonomous
B=[0;0];

%Seting what y equals to
%Using eye for C and [0 0] for D
%We make [y1,y2]=[x1,x2]
C=eye(2);

%We dont have controll of the outpus so D=0
D=[0;0];

%Sampling time (Time between taking samples
%from analog input and transforming to discrate signal 
h=1e-2;

%Start state of system
Start=0;
%Tesi is everyting working
sim('model');
plot(tout,x);
%

%%
%1
% x(k+1)=lamda*x(k)

lamda=[-1.1, -1 , -0.7 ,-0.3, 0, 0.3 ,0.7, 1, 1.1];
%Set state spaces to n=1 -->dim(x)=1 
%Make x(i+1)=1*x
%     y=x
A=1;
%Zero controll
B=0;
%Make y=x
C=1;
%Zero output controll
D=0;
h=0.1;    



for i=1:9
    %Set parameters
    A=lamda(i);
    Start=10;
    %Simulate
    sim('model');
    %Using General equation for continues Dynamic Systems
    x_continues=exp(A.*tout)*Start;
   
    figure(i);

    
    plot(tout,x,'green');
    hold on;
    plot(tout,x_continues,'blue');
    hold off;
    
    %Add displaing fetures
    grid on;
    xlabel('time t');
    ylabel('x(t)');
    axis([0 1.5  -20 20]);
    legend('Discrete Systme','Continues System');
    title({'Dynamic system with',['A=',num2str(lamda(i))],['x(0)=',num2str(Start)]});
end






