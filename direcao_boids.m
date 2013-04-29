function [ direcao ] = direcao_boids( nBoids )
%VELOCIDADE_INICIAL Summary of this function goes here
%   Detailed explanation goes here

    %gera os �ngulos iniciais para definir as dire��es de voo dos Boids. O
    %valor do �ngulo fica entre 0 e 360.
    direcao = 360 * rand(1,nBoids);
    
    %converte para radianos os �ngulos
    for i = 1 : nBoids
        direcao(i) = (direcao(i) * 3.14) / 180;
    end

end

