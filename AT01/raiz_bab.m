% DISCENTE: Luis Felipe Cunha Silva
% MATRÍCULA: 22211309
% TEC217 - MÉTODOS COMPUTACIONAIS 2025.1


% Definindo função que cálculo a raiz utilizando o método babilônico
% Recebe como parâmetros o número a ser calculado e o limite de erro
% Retorna a raiz obtida, o erro, e os valores de x que convergiram para a raiz
function [raiz, erro, x_valores] = raiz_bab(a, limite)

% É verificado se a função esta recebendo o número correto de parâmetros, para evitar
% erros
  if nargin < 2
    error('ERRO: Dois argumentos são requeridos na função');
  end

% Verifica-se o caso em que a é zero, para que todos os retornos sejam iguais a 0, nenhum
% cálculo é necessário
  if a == 0
    raiz = 0;
    erro = 0;
    x_valores = 0;
    return;

% Caso a seja negativo, a raiz é calculada utilizando o método comum sqrt, nativo do octave
  elseif a < 0
    raiz = sqrt(a);
    erro = NaN;
    x_valores = NaN;
    return;

% Em caso de a positivo, passamos a calcular utilizando o método babilônico
  else
    x_velho = a;
    x_novo = (x_velho + (a / x_velho)) / 2;
    erro = abs((x_novo - x_velho) / x_novo);

    % Definindo a variável que irá armazenar o número de iterações até alcançar a raiz,
    % e os valores de convergência de x para obter o resultado final
    iteracoes = 0;
    x_valores = [];

    while erro > limite
      iteracoes = iteracoes + 1;
      x_valores(iteracoes) = x_novo;

      x_velho = x_novo;
      x_novo = (x_velho + a / x_velho) / 2;
      erro = abs((x_novo - x_velho) / x_novo);

    end
  end

  raiz = x_novo;
end

