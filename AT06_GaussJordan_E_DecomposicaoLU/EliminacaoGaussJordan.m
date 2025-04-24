%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1

% algoritmo de GaussJordan (Resolução de sistema linear e encontrando matriz inversa)

function [x, Ainv] = EliminacaoGaussJordan(a, b)

  n = length(b);
  I = eye(n); % matriz identidade
  fprintf('\n\n    --- Início da Eliminação de Gauss-Jordan com cálculo da Inversa ---\n');

  for k = 1:n

    % Parte 1: Pivoteamento parcial
    p = k;
    Max = abs(a(k,k));
    fprintf('\n\n -> Verificando pivô na coluna %d\n\n', k);
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
      a([k p], :) = a([p k], :);
      b([k p]) = b([p k]);
      I([k p], :) = I([p k], :); % troca também na identidade
      fprintf('\nMatriz A após troca de linhas:\n');
      disp(a);
      fprintf('\nVetor b após troca de linhas:\n');
      disp(b);
    else
      fprintf('\n\n--- Nenhuma troca necessária. Maior valor para o pivô encontrado. ---\n\n');
    endif

    % Parte 2: Normalização da linha do pivô
    pivo = a(k,k);
    a(k,:) = a(k,:) / pivo;
    b(k) = b(k) / pivo;
    I(k,:) = I(k,:) / pivo;

    fprintf('\n--> Linha %d normalizada com pivô %.4f\n', k, pivo);
    fprintf('Linha %d da matriz A:\n', k);
    disp(a(k,:));
    fprintf('b(%d) = %.4f\n', k, b(k));
    fprintf('Linha %d da matriz identidade modificada:\n', k);
    disp(I(k,:));

    % Parte 3: Eliminação dos outros elementos da coluna k
    for i = 1:n
      if i != k
        fator = a(i,k);
        a(i,:) = a(i,:) - fator * a(k,:);
        b(i) = b(i) - fator * b(k);
        I(i,:) = I(i,:) - fator * I(k,:);
        fprintf('\nEliminando elemento na linha %d, coluna %d com fator %.4f\n', i, k, fator);
      endif
    endfor

    fprintf('\nMatriz A após passo %d:\n', k);
    disp(a);
    fprintf('Vetor b após passo %d:\n', k);
    disp(b);
    fprintf('Matriz identidade modificada após passo %d:\n', k);
    disp(I);
  endfor

  fprintf('\n    --- Fim da Eliminação de Gauss-Jordan ---\n\n');

  x = b;
  Ainv = I;

  fprintf('\nSolução do sistema (vetor x):\n');
  disp(x);

  fprintf('\nMatriz Inversa de A:\n');
  disp(Ainv);

endfunction


