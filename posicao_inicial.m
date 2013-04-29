function [ posicoes_boids ] = posicao_inicial( nBoids, dimensao ) 

    %gera as posições iniciais para o eixo x e eixo y dos Boids.
    %A primeira linha da matriz representa o eixo x e a segunda linha da
    %matriz representa o eixo y.
    posicoes_boids = dimensao * rand(2,nBoids);
    
end

