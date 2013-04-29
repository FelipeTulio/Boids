function [ posicoes_boids ] = separacao( posicoes_boids, nBoids, raioPessoal )
%SEPARACAO Summary of this function goes here

    
    
    for i = 1 : nBoids-1
        
        cont = i + 1;
        
        while(cont <= nBoids)
            ca = posicoes_boids(1,cont) - posicoes_boids(1,i);
            co = posicoes_boids(2,cont) - posicoes_boids(2,i);
            h = sqrt((ca * ca) + (co * co));

            if(h < raioPessoal)
                if(ca < 0)
                    posicoes_boids(1,cont) = posicoes_boids(1,cont) - 2;
                    posicoes_boids(2,cont) = posicoes_boids(2,cont) - 2;
                elseif(ca > 0)
                    posicoes_boids(1,cont) = posicoes_boids(1,cont) + 2;
                    posicoes_boids(2,cont) = posicoes_boids(2,cont) + 2;
                end

            end
            
            cont = cont + 1;
        end

    end

    
end

