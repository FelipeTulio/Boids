function [ posicoes_boids ] = espaco_voo( posicoes_boids, nBoids, dimensao )
%ESPACO_VOO Summary of this function goes here


    for i = 1 : nBoids
        if(posicoes_boids(1,i) <= 0)
            posicoes_boids(1,i) = dimensao;
        elseif(posicoes_boids(1,i) >= dimensao)
           posicoes_boids(1,i) = 0;
        elseif(posicoes_boids(2,i) <= 0)
            posicoes_boids(2,i) = dimensao;
        elseif(posicoes_boids(2,i) >= dimensao)
            posicoes_boids(2,i) = 0;
        end
    end


end

