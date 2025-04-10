% DISCENTE: Luis Felipe Cunha Silva
% Matrícula: 22211309
% MÉTODOS COMPUTACIONAIS 2025.1

% Valor de e^0.5
valor_verdadeiro = 1.648721;

x = 0.5;
aprox = 1;        % Primeiro termo da série
termo = 1;        % Termo atual
n = 1;            % Iterador de termos
erro_aprox = 100; % Inicialmente erro arbitrário alto

% Critério de parada para 3 algarismos significativos
erro_criterio = 0.05;

printf("Termo\tAproximação\tErro Verdadeiro (%%)\tErro Aproximado (%%)\n");

while erro_aprox > erro_criterio
    termo = (x^n) / factorial(n);      % Calcula novo termo
    nova_aprox = aprox + termo;       % Soma à aproximação obtida anterior
    erro_verdadeiro = abs((valor_verdadeiro - nova_aprox) / valor_verdadeiro) * 100;
    erro_aprox = abs((nova_aprox - aprox) / nova_aprox) * 100;

    printf("%d\t%.6f\t%.6f\t\t\t%.6f\n", n, nova_aprox, erro_verdadeiro, erro_aprox);

    aprox = nova_aprox;
    n = n + 1;
end

printf("\nValor final aproximado com %d termos: %.6f\n", n-1, aprox);
printf("Erro verdadeiro final: %.6f%%\n", erro_verdadeiro);




