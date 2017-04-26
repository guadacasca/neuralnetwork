function  [Ip,contpois]=Trenpoiss(amp,lambda,dt,cont)
    r   = rand;
    lim = 1-exp(-1*lambda*dt);
    if r<lim
        contpois = 0; Ip = amp; 
    else
        contpois = cont+dt; 
        Ip = amp*exp(-lambda*contpois);
    end

end