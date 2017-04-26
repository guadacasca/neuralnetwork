
function celula=TipoCelula(tam,inh,tipo) % ceros son inhibitorias y 1 son excitatorias
    if strcmp(tipo,'f')
        celula = [0;1;1;1;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;0;1;0;1;1;1;0;1;1;0;1;1;1;1;1;0;0;1;1;1;1;1;1;1;1;1;1;0;1;1;0;0;1;1;0;1;0;1;1;1;1;0;0;1;1;1;1;1;1;1;1;1;1;0;0;1;1;1;0;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1];
    else
        celula=zeros(tam,1);
        r=rand(tam,1);
    
        for i=1:tam
            if r(i)> inh
                celula(i)=1;
            end
        end
    end 
end