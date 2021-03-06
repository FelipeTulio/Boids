function [ direcao ] = alinhamento( posicoes_boids, nBoids, raioVisao, direcao)
%ALINHAMENTO Summary of this function goes here

    
    indices = zeros(1,nBoids);
    
    for i = 1 : nBoids-1
        
        soma_angulos = direcao(i);
        cont = i + 1;
        
        while(cont <= nBoids)
            ca = posicoes_boids(1,cont) - posicoes_boids(1,i);
            co = posicoes_boids(2,cont) - posicoes_boids(2,i);
            h = sqrt((ca * ca) + (co * co));
            
            if(h <= raioVisao)
                soma_angulos = soma_angulos + direcao(cont);
                indices(cont) = 1;
            end
            
            cont = cont + 1;   
        end
       
        media_angulo = mean(soma_angulos);
        
        for k = 1 : nBoids
            if(indices(k) == 1)
                direcao(k) = media_angulo;
            end
        end
        
    end
    
    


end

