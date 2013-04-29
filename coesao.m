function [ media_centro ] = coesao( posicoes_boids, nBoids, media_centro, boid )
%COESAO Summary of this function goes here

       
        cont = 1;
        
        centro_massa = posicoes_boids(:,boid);
        
        while(cont <= nBoids)
           if(cont ~= boid)
               centro_massa = centro_massa + posicoes_boids(:, cont);
           end
           
           cont =cont + 1;
        end

        media_centro(1,1) = centro_massa(1,1) / (nBoids - 1);
        media_centro(2,1) = centro_massa(2,1) / (nBoids - 1);
        
        media_centro = media_centro / 80;

end

