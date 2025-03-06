% DISCENTE: Luis Felipe Cunha Silva
% MATRÍCULA: 22211309
% TEC217 - MÉTODOS COMPUTACIONAIS 2025.1

% Definindo o vetor com os números que serão testados
vetor_alpha = [0, 2, 10, -4];

% Definição da tolerância para o erro
limite = 1e-4;

% Definindo que um gráfico será gerado pelo script, com função para manter
% curvas diversas em um mesmo gráfico
figure;
hold on;

% Estrutura de repetição percorre o vetor_alpha para enviar os números a serem
% testados paraa a função que realiza o cálculo
for i = 1:length(vetor_alpha)

    % Recebemos da função a raiz obtida, o erro aproximado e os valores de x calculados
    % até alcançar a raiz, necessário para desenvolver a curva de convergência no gráfico
   [raiz, erro, x_valores] = raiz_bab(vetor_alpha(i), limite);

   % Exibe o índice, a raiz e o erro de forma formatada
   disp(sprintf('Número: %d, Raiz: %s, Erro: %.2e', vetor_alpha(i), num2str(raiz), erro));

    % Plota os valores para a convergência, o número de iterações até alcançar o valor final
    % é dado pelo tamanho do vetor de valores de x.
    if ~isnan(x_valores)
        plot(1:length(x_valores), x_valores, '-o', 'DisplayName', ['a = ', num2str(vetor_alpha(i))]);
    end
end

xlabel('Iterações');
ylabel('Valor de x');
title('Convergência do X');
legend show; % Legenda para cada caso de teste
grid on;
hold off;




