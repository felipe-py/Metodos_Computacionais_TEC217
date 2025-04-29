function [x, Ainv] = EliminacaoGaussJordan(a, b)

  A_original = a; % Salva cópia original para norma e número de condição
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

  % Parte 4: Cálculo das normas e número de condição
  fprintf('\n--- Cálculo das Normas e Número de Condição ---\n');

  % NORMA 1 (máximo da soma das colunas)
  fprintf('\nCálculo da Norma 1 (máximo das somas das colunas):\n\n');
  soma_colunas = zeros(1, n);
  for j = 1:n
    soma_colunas(j) = sum(abs(A_original(:, j)));
    fprintf('Soma da coluna %d: %.4f\n', j, soma_colunas(j));
  endfor
  norma1_A = max(soma_colunas);
  fprintf('Norma 1 = %.4f\n\n', norma1_A);

  % NORMA INFINITO (máximo da soma das linhas)
  fprintf('\nCálculo da Norma Infinito (máximo das somas das linhas):\n\n');
  soma_linhas = zeros(1, n);
  for i = 1:n
    soma_linhas(i) = sum(abs(A_original(i, :)));
    fprintf('Soma da linha %d: %.4f\n', i, soma_linhas(i));
  endfor
  norma_inf_A = max(soma_linhas);
  fprintf('Norma Infinito = %.4f\n\n', norma_inf_A);

  % NORMA 2 (valor próprio máximo de A^T * A)
  fprintf('\nCálculo da Norma 2 (raiz do maior valor próprio de AᵀA):\n\n');
  ATA = A_original' * A_original;
  fprintf('Matriz AᵀA:\n');
  disp(ATA);
  autovalores = eig(ATA);
  fprintf('\nAutovalores de AᵀA:\n');
  disp(autovalores);
  maior_autovalor = max(autovalores);
  norma2_A = sqrt(maior_autovalor);
  fprintf('\nNorma 2 = sqrt(%.4f) = %.4f\n\n', maior_autovalor, norma2_A);

  % Cálculo das normas da inversa também
  norma1_Ainv = norm(Ainv, 1);
  norma_inf_Ainv = norm(Ainv, inf);
  norma2_Ainv = norm(Ainv, 2);

  fprintf('\nNorma 1 da matriz inversa A⁻¹: %.4f\n', norma1_Ainv);
  fprintf('Norma 2 da matriz inversa A⁻¹: %.4f\n', norma2_Ainv);
  fprintf('Norma Infinito da matriz inversa A⁻¹: %.4f\n', norma_inf_Ainv);

  % Número de condição para cada norma
  cond1 = norma1_A * norma1_Ainv;
  cond2 = norma2_A * norma2_Ainv;
  condinf = norma_inf_A * norma_inf_Ainv;

  fprintf('\nNúmero de condição usando Norma 1: %.4f\n', cond1);
  fprintf('Número de condição usando Norma 2: %.4f\n', cond2);
  fprintf('Número de condição usando Norma Infinito: %.4f\n', condinf);

endfunction

