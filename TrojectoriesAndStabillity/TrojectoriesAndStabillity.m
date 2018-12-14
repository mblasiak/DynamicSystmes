clc;
close all;
clear;




%Podwójna wartość własna 0 dzielnik liniowy
%P=[1 0 ; 1 1];
P=eye(2);

%Wybrana macierz Jordana (oddkomentować)

%1 Podwójna wartość własna 0 dzielnik liniowy
%J=[0,0;0,0];

%2 Podwójna wartość własna 0 dzielnik nieliniowy
%J=[0,1;0,0];

%3 Wartość własna_1=0 własna_2<0 
%J=[-1,0;0,0];

%4 Wartość własna_1<0 własna_2<0 
J=[-2,0;0,-1];
%J=[-1,0;0,-5];


%5 Wartość własna podwójna <0 dzielnik nieliniowy 
%J=[-1,1;0,-1];
%J=[-4,1;0,-4];

%6 Wartość własna podwójna <0 dzielnik liniowy 
%J=[-1,0;0,-1];

%7  Wartość własna_1>0  własna_2 <0 
%J=[-1,0;0,1];
%J=[-3,0;0,1];


%8 Para sprzężona Re=0
%J=[0,1;-1,0];


%9 Para sprzężona Re<0
%J=[-1,1;-1,-1];



%Rozne wektory własne
%P=[1 1 ; 1 1];
P=[1 1 ; 0 1];
%P=[1 0.5 ; 1 1];
%P=[0 0 ; 1 1];



%OBliczanie A na podstwie macierzy przejścia P
A=P*J*P^-1;

figure(1);
subplot(1,2,1);
for z=0:0.1:(2*pi)
   
    WPC=[sin(z);cos(z)];
    sim('model');
    %Zmiana wartości własnych podczas rysowania
    %if z>pi
    %   J=[0,1;0,0];
    %    A=P*J*P^-1;
    %end
    %Dla niektórych wartoći warto użyć rysowania ze znacznikiem
    %plot(x(:,1),x(:,2),'blue-+')
    plot(x(:,1),x(:,2),'blue')
    xlabel("x1");
    ylabel("x2");
    title("Portret Fazowy ");
    hold on;
end  
    hold on;
    plot([0 P(1,1)],[0 P(2,1)],'red');
    hold on;
    plot([0 P(1,2)],[0 P(2,2)],'green');
    hold on;
    

subplot(1,2,2);
for z=0:0.1:(2*pi)
    
    Q=[abs(sin(z)), abs(cos(z))];
    p=max(Q);
    
    WPC=[sin(z)/p;cos(z)/p];
    sim('model');
    
    %Dla niektórych wartoći warto użyć rysowania ze znacznikiem
    %plot(x(:,1),x(:,2),'blue-+')
    plot(x(:,1),x(:,2),'blue')
    xlabel("x1");
    ylabel("x2");
    title("Portret Fazowy ");
    hold on;
    
end  

plot([0 P(1,1)],[0 P(2,1)],'red');
    hold on;
    plot([0 P(1,2)],[0 P(2,2)],'green');
    hold on;


