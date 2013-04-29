%LIMPEZA DE EXECUÇÕES ANTERIORES
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------


%MENU DE APRESENTAÇÃO
%--------------------------------------------------------------------------
fprintf('+------------------------------------------------------------------------+\n');
fprintf('|           FACULDADE DE CIÊNCIA E TECNOLOGIA DE MONTES CLAROS           |\n');
fprintf('|                           COMPUTAÇÃO NATURAL                           |\n');
fprintf('|                      Simulação da Natureza - Boids                     |\n');
fprintf('|                       (Prof. Ms. Renato Dourado)                       |\n');
fprintf('|                  Acadêmico: Felipe Túlio de Castro                     |\n');
fprintf('+------------------------------------------------------------------------+\n');

%--------------------------------------------------------------------------


%DEFINIÇÃO DE PARÂMETROS INICIAS
%--------------------------------------------------------------------------
%quantidade de boids
nBoids = 30;
%velocidade dos Boids
velocidade = 3;
%Ângulo de voo dos Boids
[ direcao ] = direcao_boids( nBoids );
%raio pessoal de cada Boid
raioPessoal = 3;
%raio de visão para o voo
raioVisao = 5;
%Dimensão do plano cartesiano
dimensao = 150;
%delimitar espaço cartesiano
vetor = [0, dimensao, 0, dimensao];

%
boid = round(((nBoids-1) * rand))  + 1;

%
media_centro = [0;0];

%função para criar as posições iniciais
[ posicoes_boids ] = posicao_inicial( nBoids, dimensao );

%--------------------------------------------------------------------------


%LAÇO DE REPETIÇÃO PARA AS REGRAS DE MOVIMENTAÇÃO DOS BOIDS
%--------------------------------------------------------------------------
while(true)
    %movimentação dos boids
    [ posicoes_boids ] = novas_posicoes( posicoes_boids, nBoids, direcao, velocidade, media_centro );

    %contole de saída do espaço de voo
    [ posicoes_boids ] = espaco_voo( posicoes_boids, nBoids, dimensao );

    %Regras de comportamento dos Boids, segundo Craig Reynolds.
    
    %Regra do alinhamento
    [ direcao ] = alinhamento( posicoes_boids, nBoids, raioVisao, direcao);
    
    %Regra da coesão
    [ media_centro ] = coesao( posicoes_boids, nBoids, media_centro, boid );
    
    %Regra da separação
    [ posicoes_boids ] = separacao( posicoes_boids, nBoids, raioVisao);

    %plotar as posições dos Boids. O comando 'axis' controla a dimensão do
    %plano cartesiano.
    plot(posicoes_boids(1,:),posicoes_boids(2,:),'>', 'MarkerFaceColor', 'b');
    axis(vetor);
    title('BOIDS');
    
    pause(0.4); 
end
%--------------------------------------------------------------------------