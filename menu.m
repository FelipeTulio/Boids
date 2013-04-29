%LIMPEZA DE EXECU��ES ANTERIORES
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------


%MENU DE APRESENTA��O
%--------------------------------------------------------------------------
fprintf('+------------------------------------------------------------------------+\n');
fprintf('|           FACULDADE DE CI�NCIA E TECNOLOGIA DE MONTES CLAROS           |\n');
fprintf('|                           COMPUTA��O NATURAL                           |\n');
fprintf('|                      Simula��o da Natureza - Boids                     |\n');
fprintf('|                       (Prof. Ms. Renato Dourado)                       |\n');
fprintf('|                  Acad�mico: Felipe T�lio de Castro                     |\n');
fprintf('+------------------------------------------------------------------------+\n');

%--------------------------------------------------------------------------


%DEFINI��O DE PAR�METROS INICIAS
%--------------------------------------------------------------------------
%quantidade de boids
nBoids = 30;
%velocidade dos Boids
velocidade = 3;
%�ngulo de voo dos Boids
[ direcao ] = direcao_boids( nBoids );
%raio pessoal de cada Boid
raioPessoal = 3;
%raio de vis�o para o voo
raioVisao = 5;
%Dimens�o do plano cartesiano
dimensao = 150;
%delimitar espa�o cartesiano
vetor = [0, dimensao, 0, dimensao];

%
boid = round(((nBoids-1) * rand))  + 1;

%
media_centro = [0;0];

%fun��o para criar as posi��es iniciais
[ posicoes_boids ] = posicao_inicial( nBoids, dimensao );

%--------------------------------------------------------------------------


%LA�O DE REPETI��O PARA AS REGRAS DE MOVIMENTA��O DOS BOIDS
%--------------------------------------------------------------------------
while(true)
    %movimenta��o dos boids
    [ posicoes_boids ] = novas_posicoes( posicoes_boids, nBoids, direcao, velocidade, media_centro );

    %contole de sa�da do espa�o de voo
    [ posicoes_boids ] = espaco_voo( posicoes_boids, nBoids, dimensao );

    %Regras de comportamento dos Boids, segundo Craig Reynolds.
    
    %Regra do alinhamento
    [ direcao ] = alinhamento( posicoes_boids, nBoids, raioVisao, direcao);
    
    %Regra da coes�o
    [ media_centro ] = coesao( posicoes_boids, nBoids, media_centro, boid );
    
    %Regra da separa��o
    [ posicoes_boids ] = separacao( posicoes_boids, nBoids, raioVisao);

    %plotar as posi��es dos Boids. O comando 'axis' controla a dimens�o do
    %plano cartesiano.
    plot(posicoes_boids(1,:),posicoes_boids(2,:),'>', 'MarkerFaceColor', 'b');
    axis(vetor);
    title('BOIDS');
    
    pause(0.4); 
end
%--------------------------------------------------------------------------