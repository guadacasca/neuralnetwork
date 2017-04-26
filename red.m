close all
clear all
clc

tam        = 100;
matriz     = load('red100.dat');
celulas    = TipoCelula(tam,0.2,'f');
E          = InvertionPotential(celulas);
adyacencia = Conductancias(matriz,celulas,0);
estados    = zeros(tam,1);
amp        = 5;
lambda     = 14;

It         = 7000;
dt         = 0.05;
a_inh      = 0.1;
b = 0.2;
c = -65;
d_inh = 2;
a_exc=0.02;
d_exc=8;

v0=-65*rand(tam,1);
u0=v0*b;
contpois = zeros(1,tam);
for j=1:It
    Isyn=corr_sinp(adyacencia,v0,E);
    for i=1:tam
        [Ip(i),contpois(i)]=Trenpoiss(amp,lambda,dt,contpois(i));
        if celulas(i)==0
            [v(i),u(i)] = modelo(Isyn(i)+Ip(i),u0(i),v0(i),a_inh,b,c,d_inh,dt);
%             [v(i),u(i)] = modelo(Isyn(i)+2,u0(i),v0(i),a_inh,b,c,d_inh,dt);
        else
            [v(i),u(i)] = modelo(Isyn(i)+Ip(i),u0(i),v0(i),a_exc,b,c,d_exc,dt);
%             [v(i),u(i)] = modelo(Isyn(i)+2,u0(i),v0(i),a_exc,b,c,d_exc,dt);
        end
    end
    
    u0 = u';
    v0 = v';
    Volt(j,:) = v;
    I_syn(j,:)=Isyn;
end







