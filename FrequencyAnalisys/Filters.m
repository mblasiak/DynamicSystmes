%Clear all left overs
clc;
close all;
clear;

%Define diffrent  filters

%LowPass
fil_lowpass=tf([0 1],[4 1]);
%UpperPass
fil_upperpass=tf([0.4 0],[0.4 1]);
%Range Pass
fil_rangepass=tf([1 0],[1 2 1])
%Second Degree 
fil_secnd=tf([0 1],[4 0.1 1]);

%Show Bode Diagram of those systems

figure;
bode(fil_lowpass);
title('Low Pass');

figure;
bode(fil_upperpass);
title('Upper Pass');

figure;
bode(fil_rangepass);
title('Low Pass');

figure;
bode(fil_secnd);
title('Second Degree');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

