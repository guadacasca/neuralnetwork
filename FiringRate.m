function [excitatory inhibitory]=FiringRate(Volt,celulas,bin)

    [n m]=size(Volt);
    raster=zeros(n,m);
    inh=find(celulas==0);
    exc=find(celulas);
    Volt2(:,1:length(inh))=Volt(:,inh);
    Volt2(:,length(inh)+1:m)=Volt(:,exc);
    
    for i=2:n
        for j=1:m
            if Volt2(i,j)>0 && Volt2(i-1,j)<0
                raster(i,j)=1;
            end
        end
    end
    
    firing_exc=sum(raster(:,length(inh)+1:m),2);
    auxiliar=reshape(firing_exc,n/bin,bin);
    excitatory=sum(auxiliar,2);
    
    firing_inh=sum(raster(:,1:length(inh)),2);
    auxiliar2=reshape(firing_inh,n/bin,bin);
    inhibitory=sum(auxiliar2,2);    
    

end