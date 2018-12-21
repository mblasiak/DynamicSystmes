clc;
close all;
clear;


%Set maximum nuber of interations
ite=5;
%Set precission of searching for equation solution
eps=0.0000001;

%Set staring point
start=16;

%Equation in wich we search for solution
equ=@(x) x^3-2*x^2-11*x+12;
%Equation dervative
equ_prim=@(x) 3*x^2-4*x-11;

%Preset of parameters
last_x=start;
new_x=last_x-(equ(last_x)/equ_prim(last_x));

%Search for solution with defined ruleset
while( abs(equ(new_x))>eps && abs(last_x-new_x)>=eps && ite>=0)
    last_x=new_x;
    new_x=last_x-(equ(last_x)/equ_prim(last_x));
    ite=ite-1;
    
end
if abs(equ(new_x))<=eps
    disp('Solution was found');
    disp(["x=",num2str(new_x)]);
    disp(["f(x)=",num2str(equ(new_x))]);
else
    disp('Solution not found');
end
%%