%Main 
close all; clear all; clc

It =10000000;
dt = 0.05;
a = 0.1;
b = 0.2;
c = -65;
d = 2;
u0=0;v0=-65;
I  = 3.7;
di = 0.2;
t1=0;
count=1;
    for i=1:It
        r=randn(1,1);
        [v,u] = modelo(I+r,u0,v0,a,b,c,d,dt);
        u0 = u;
        v0 = v;
        Volt(i) = v;
        if v>0
            tiempo(count)=i*dt-t1;
            t1=i*dt;
            count=count+1;
        end
            
    end


figure;
hist(tiempo,80)
save('inh_hist.mat','tiempo')
