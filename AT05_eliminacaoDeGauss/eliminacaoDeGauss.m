%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1


% Implementação do algoritmo de eliminação de Gauss sem pivoteamento

function x = eliminacaoDeGauss(a,b);

  % Parte 1: Eliminação progressiva

  n = length(b);

  fprintf('\n    --- Início da Eliminação Progressiva ---\n');
  for k = 1:n-1
    fprintf('\n --> Pivô na posição (%d,%d) da matriz = %.2f\n\n', k, k, a(k,k));
    for i = k+1:n
      fator = a(i,k) / a(k,k);
     fprintf('Linha %d sendo atualizada com fator (%.2f / %.2f) = %.2f\n', i, a(i,k), a(k,k), fator);
      for j = k:n
        a(i,j) = a(i,j) - fator * a(k,j);
      end
      b(i) = b(i) - fator * b(k);
    end

    % Print do estado atual da matriz A e vetor B
    fprintf('\nMatriz A após passo %.2f:\n', k);
    disp(a);
    fprintf('\nVetor b após passo %.2f:\n', k);
    disp(b);
  end
  fprintf('\n    --- Fim da Eliminação Progressiva ---\n\n');

  
  % Parte 2: Substituição progressiva

  fprintf('    --- Início da Substituição Regressiva ---\n\n');
  x(n) = b(n) / a(n,n);
  fprintf('x(%d) = %.2f\n', n, x(n));

  for i = n-1:-1:1
    soma = b(i);
    for j = i+1:n
      soma = soma - a(i,j) * x(j);
      fprintf('\nAtualizando soma na linha %d: %.2f\n', i, soma);
    end
    x(i) = soma / a(i,i);
    fprintf('x(%d) = %.2f\n', i, x(i));
  end
  fprintf('\n    --- Fim da Substituição Regressiva ---\n');

