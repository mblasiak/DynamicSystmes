clc;
close all;
clear;


a=20;
b=0;
ite=10;
eps=0.1;

start=50;


equ=@(x) x^3-2*x^2-11*x+12;
equ_prim=@(x) 3*x^2-4*x-11;

last_x=start;
new_x=last_x-(equ(last_x)/equ_prim(last_x));

while( abs(equ(new_x))>eps && abs(last_x-new_x)>=eps && ite>=0)
    last_x=new_x;
    new_x=last_x-(equ(last_x)/equ_prim(last_x));
    ite=ite-1;
    
end

equ(new_x)

%%