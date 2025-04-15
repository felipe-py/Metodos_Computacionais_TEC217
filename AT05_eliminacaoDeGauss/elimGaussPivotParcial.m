%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1

% Implementação do algoritmo de eliminação de Gauss com pivoteamento parcial

function x = elimGaussPivotParcial(a, b)

  n = length(b);

  fprintf('\n\n\n\n\n\n\n\n\n\n\n    --- Início da Eliminação Progressiva com Pivoteamento Parcial ---\n');

  for k = 1:n-1

     % Parte 1: Pivoteamento parcial
    p = k;
    Max = abs(a(k,k));
    fprintf('\n\n ->Verificando pivô na coluna %d\n\n', k);
    fprintf('Pivô inicial (linha %d): |%.4f|\n\n', k, Max);

    for ii = k + 1:n
      teste = abs(a(ii,k));
      fprintf('\nComparando com linha %d: |%.4f|\n\n', ii, teste);
      if teste > Max
        Max = teste;
        p = ii;
        fprintf('\n   ---> Novo maior valor encontrado: |%.4f| na linha %d\n', Max, p);
      endif
    endfor

    if p != k
      fprintf('\n\nTROCA NECESSÁRIA: linha %d <-> linha %d\n', k, p);
      fprintf('\n   Valor do pivô antes da troca: %.4f\n', a(k,k));
      fprintf('\n   Novo pivô após troca: %.4f\n\n', a(p,k));
      a([k p], :) = a([p k], :);
      b([k p]) = b([p k]);
      fprintf('\nMatriz A após troca de linhas:\n');
      disp(a);
      fprintf('\nVetor b após troca de linhas:\n\n');
      disp(b);
    else
      fprintf('\n\n---Nenhuma troca necessária. Maior valor para o pivõ encontrado.---\n\n');
    endif

    % Parte 2: Eliminação progressiva
    fprintf('\n --> Pivô na posição (%d,%d) da matriz = %.2f\n\n', k, k, a(k,k));

    for i = k + 1:n
      fator = a(i,k) / a(k,k);
      fprintf('Linha %d sendo atualizada com fator (%.2f / %.2f) = %.2f\n', i, a(i,k), a(k,k), fator);
      for j = k:n
        a(i,j) = a(i,j) - fator * a(k,j);
      endfor
      b(i) = b(i) - fator * b(k);
    endfor

    % Print do estado atual da matriz A e vetor B
    fprintf('\nMatriz A após passo %d:\n', k);
    disp(a);
    fprintf('\nVetor b após passo %d:\n', k);
    disp(b);
  endfor

  fprintf('\n    --- Fim da Eliminação Progressiva ---\n\n');

  % Parte 3: Substituição regressiva
  fprintf('\n    --- Início da Substituição Regressiva ---\n\n');

  x = zeros(n, 1); % vetor solução inicializado
  x(n) = b(n) / a(n,n);
  fprintf('x(%d) = %.2f\n', n, x(n));

  for i = n-1:-1:1
    soma = b(i);
    for j = i+1:n
      soma = soma - a(i,j) * x(j);
      fprintf('\nAtualizando soma na linha %d: %.2f\n', i, soma);
    endfor
    x(i) = soma / a(i,i);
    fprintf('x(%d) = %.2f\n', i, x(i));
  endfor

  fprintf('\n    --- Fim da Substituição Regressiva ---\n');
endfunction

