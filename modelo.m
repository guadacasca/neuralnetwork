%Dinamica de la neurona
function [v,u]=modelo(I,u0,v0,a,b,c,d,dt)
    dv  = 0.04*v0*v0+5*v0+140-u0+I;
    du  = a*(b*v0-u0);
    u   = eul(dt,u0,du);
    v   = eul(dt,v0,dv);
    if v>=30
        v = c; u = u+d;
    end
end