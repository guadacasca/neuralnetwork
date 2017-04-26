
function [cv isi]=InterSpikeInterval(Volt,celulas,dt)

    [n m]=size(Volt);
    raster=zeros(n,m);
    inh=find(celulas==0);
    exc=find(celulas);
    Volt2(:,1:length(inh))=Volt(:,inh);
    Volt2(:,length(inh)+1:m)=Volt(:,exc);
    isi = [];
    for j=1:m
        count=1;temp=[];
        for i=2:n
            if Volt2(i,j)>0 && Volt2(i-1,j)<0
                temp(count)=i;
                count=count+1;
            end
        end
        if length(temp)>1
            isi=[isi diff(temp)*dt];
        end
        if length(temp)>10
            cv(j)= std(diff(temp)*dt)/mean(diff(temp)*dt);
        end
    end

    
    
    
end