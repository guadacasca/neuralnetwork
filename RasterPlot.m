

function RasterPlot(Volt,celulas,cond)

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

    figure(1)
    hold on
    for i=1:m
        for j=1:n
            if raster(j,i)>0
                plot(j,i,'k.')
            end
        end
    end
    plot(xlim,[length(inh) length(inh)],'b')
    xlabel( 'Time [iterations]')
    ylabel('Neuron')
    title('Raster Plot')
    set(gca,'Xlim',[200 n])
%     saveas(1,strcat('RasterPlot',cond),'png')
end