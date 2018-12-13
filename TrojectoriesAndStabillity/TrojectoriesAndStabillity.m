clc;
close all;
clear;

P=eye(2);

J=[0,0;0,0];

A=P*J*P^-1;




for z=0:0.05:(2*pi)
   
    WPC=[sin(z),cos(z)];
    sim('model');
    
    plot(x(:,1),x(:,2),'blue')
    
    hold on;
    
end  