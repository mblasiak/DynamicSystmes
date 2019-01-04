clc;
close all;
clear;
%100hz~630rad/s
%Now test diffrent values of R and C by looking at they filtration result
%at Bode plot
%Use matlab plot cursor to veryfie with greater preission
%Paramaters fullfilling task objective
R=0.02;
C=1;
sys=tf([0 1],[R*C 1]);
bode(sys);
%You can see that frequenies higher than 630rad/s are lowered by more then
%21dB 