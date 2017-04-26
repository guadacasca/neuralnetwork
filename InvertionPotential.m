
function E=InvertionPotential(celulas)

    E=zeros(length(celulas),1);
    
    for i=1:length(celulas)
        if celulas(i)==0
            E(i)=-80;
        end
    end

end