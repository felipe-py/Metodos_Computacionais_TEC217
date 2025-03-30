% DISCENTE: Luis Felipe Cunha Silva
% Matrícula: 22211309
% MÉTODOS COMPUTACIONAIS 2025.1

% Definição da função f(x)
f = @(x) -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25*x + 1.2;

% Derivada exata f'(x)
f_prim_exata = @(x) -0.4*x.^3 - 0.45*x.^2 - 1.0*x - 0.25;

% Ponto de interesse
x = 0.5;
f_prim_real = f_prim_exata(x);

% Inicializando valores
h_values = [1, 0.1, 0.01, 0.001, 0.0001, 0.00001];
dif_centrada = zeros(size(h_values));
erro_verdadeiro = zeros(size(h_values));

printf("Tamanho do passo (h) | Derivada (dif. centrada) | Erro verdadeiro\n");

for i = 1:length(h_values)
    h = h_values(i);
    derivada_aprox = (f(x + h) - f(x - h)) / (2*h);
    erro = abs(f_prim_real - derivada_aprox);

    dif_centrada(i) = derivada_aprox;
    erro_verdadeiro(i) = erro;

    printf("%17.5e | %24.8f | %14.8f\n", h, derivada_aprox, erro);
end

figure;
loglog(h_values, erro_verdadeiro, '-o', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Tamanho do passo (h)');
ylabel('Erro verdadeiro');
title('Erro da Derivada por Diferença Centrada vs h');
grid on;

