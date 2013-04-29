function [ posicoes_boids ] = novas_posicoes( posicoes_boids, nBoids, direcao, velocidade, media_centro )
%NOVAS_POSICOES Summary of this function goes here
%   Detailed explanation goes here

    for i = 1 : nBoids
        cateto_x = cos(direcao(i)) * velocidade + media_centro(1,1);
        cateto_y = sin(direcao(i)) * velocidade + media_centro(2,1);
        
        posicoes_boids(1,i) = posicoes_boids(1,i) + cateto_x;
        posicoes_boids(2,i) = posicoes_boids(2,i) + cateto_y;
    end

   
end

