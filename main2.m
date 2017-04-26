%Main 
close all; clear all; clc

It =10000;
dt = 0.05;
a = 0.02;
b = 0.2;
c = -65;
d = 8;
u0=0;v0=-65;
I  = 4;
di = 0.2% for n=1:200
%     cont = 0;
    for i=1:It
        [v,u] = modelo(I,u0,v0,a,b,c,d,dt);
        u0 = u;
        v0 = v;
        Volt(i) = v;
%         if v0>=20
%             cont = cont+1;
%         end
    end
%     F(n)= cont;
%     Curr(n) = I;
%     I=I+di;
% end


figure;
plot(Volt)
save('exc_volt.mat','Volt')
% figure(100)
% plot(Curr,F,'ok','markersize',5)