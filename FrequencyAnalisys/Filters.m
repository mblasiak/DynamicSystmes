%Clear all left overs
clc;
close all;
clear;

%Define diffrent  filters

%LowPass
L=[0 1];
M=[4 1];
fil_lowpass=tf(L,M);
%UpperPass
L=[0.4 0];
M=[0.4 1];
fil_upperpass=tf(L,M);
%Range Pass
L=[1 0];
M=[1 2 1];
fil_rangepass=tf(L,M)
%Second Degree
L=[0 1]
M=[4 0.1 1]
fil_secnd=tf(L,M);

%Show Bode Diagram of those systems

figure;
bode(fil_lowpass);
title('Low Pass');

figure;
bode(fil_upperpass);
title('Upper Pass');

figure;
bode(fil_rangepass);
title('Range Pass');

figure;
bode(fil_secnd);
title('Second Degree');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
close all;
v_L=[0 1;0.4 0;1 0;0 1];
v_M=[0 4 1;0 0.4 1; 1 2 1; 4 0.1 1];
titles=['low pass  ';'upper pass';'range pass';'2nd degree'];
%Sin frequnecy  Ampitude and pahse
v_f=[0.001 1 30 0.01 5];
v_A=[2 3 1 2 4];
v_p=[1 5 2 1 0];

%Set Transmitatio of the model  T=(L/M)
L=[3 3];
M=[1 2 21];

for i=1:5
    f=v_f(i);
    A=v_A(i);
    p=v_p(i);
    figure;
    for z=1:4
        L=v_L(z,:);
        M=v_M(z,:);
        subplot(2,2,z);
        
        %Simulatee
        sim('model_2');

        %Plot Control and State on the same graph

        plot(tout,out(:,1));
        hold on;
        plot(tout,out(:,2));
        hold on;
        xlabel('time');
        ylabel('value');
        legend('Control','State');
        title(titles(z,:));
        
        end
    end