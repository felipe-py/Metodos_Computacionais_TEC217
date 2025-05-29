function coef = RegressaoPolinomial (x_dados, y_dados, g)

  n = length(x_dados);
  m = g + 1; % Número de coeficientes a determinar (grau g + termo constante)

  % Inicialização da matriz 'a' (X^T*X) e do vetor 'b' (X^T*y)
  a = zeros(m,m);
  b = zeros(m,1);

  % --- FORMATAÇÃO DO SISTEMA DE EQUAÇÕES (Matriz 'a' e Vetor 'b') ---
  % Monta a matriz 'a' (matriz dos somatórios de x elevado a potências)
  % a(i,j) = soma(x_dados ^ ((i-1) + (j-1)))
  for i_linha = 1:m
    for j_coluna = 1:m
      potencia_atual = (i_linha - 1) + (j_coluna - 1);
      soma_pot_x = 0;
      for k_dado = 1:n
        if x_dados(k_dado) == 0 && potencia_atual == 0
          soma_pot_x = soma_pot_x + 1; % 0^0 é tratado como 1 neste contexto
        else
          soma_pot_x = soma_pot_x + x_dados(k_dado)^potencia_atual;
        end
      endfor
      a(i_linha, j_coluna) = soma_pot_x;
    endfor
  endfor

  % Monta o vetor 'b' (vetor soma de produtos y * x elevado a potências)
  % b(i) = soma(y_dados * x_dados ^ (i-1))
  for i_linha = 1:m
    potencia_atual = i_linha - 1;
    soma_prod_y_xpot = 0;
    for k_dado = 1:n
      if x_dados(k_dado) == 0 && potencia_atual == 0
        soma_prod_y_xpot = soma_prod_y_xpot + y_dados(k_dado); % y * x^0 = y * 1
      else
        soma_prod_y_xpot = soma_prod_y_xpot + y_dados(k_dado) * (x_dados(k_dado)^potencia_atual);
      end
    endfor
    b(i_linha) = soma_prod_y_xpot;
  endfor

  % --- RESOLUÇÃO DO SISTEMA LINEAR (a * coef = b) ---
  % Implementação da Eliminação Gaussiana para obter uma matriz triangular superior
  pv = 0; % Pivô
  for k_col_pivo = 1:m-1 % Para cada coluna que será usada como pivô
    for i_linha_elim = k_col_pivo+1:m % Para cada linha abaixo da linha do pivô
      if a(k_col_pivo, k_col_pivo) == 0
          % Se o pivô for zero, idealmente você procuraria uma troca de linhas.
          % Para simplificar e manter fiel ao seu código original,
          % pode ocorrer um erro de divisão por zero se o pivô for zero.
          % Uma implementação robusta incluiria pivotamento parcial.
          warning('Elemento pivô é zero. Resultados podem ser imprecisos ou errados.');
          % Continuar pode levar a Inf ou NaN.
      endif
      pv = a(i_linha_elim, k_col_pivo) / a(k_col_pivo, k_col_pivo);
      a(i_linha_elim, k_col_pivo) = 0; % Zera o elemento abaixo do pivô
      for j_col_atual = k_col_pivo+1:m % Para os demais elementos da linha
        a(i_linha_elim, j_col_atual) = a(i_linha_elim, j_col_atual) - pv * a(k_col_pivo, j_col_atual);
      endfor
      b(i_linha_elim) = b(i_linha_elim) - pv * b(k_col_pivo); % Modifica o vetor b também
    endfor
  endfor

  % --- SOLUÇÃO DO SISTEMA (Substituição Reversa) ---
  coef = zeros(m,1); % Inicializa o vetor de coeficientes
  if a(m,m) == 0
      warning('Divisão por zero na substituição reversa. Sistema pode não ter solução única.');
      % Lidar com este caso (ex: atribuir NaN ou erro)
      coef(m) = NaN;
  else
      coef(m) = b(m) / a(m,m);
  endif

  for k_linha_sol = m-1:-1:1 % Itera de baixo para cima (da penúltima linha até a primeira)
    soma_ax = 0;
    for j_col_sol = k_linha_sol+1:m
      soma_ax = soma_ax + a(k_linha_sol, j_col_sol) * coef(j_col_sol);
    endfor
    if a(k_linha_sol, k_linha_sol) == 0
        warning('Divisão por zero na substituição reversa. Sistema pode não ter solução única.');
        coef(k_linha_sol) = NaN;
    else
        coef(k_linha_sol) = (b(k_linha_sol) - soma_ax) / a(k_linha_sol, k_linha_sol);
    endif
  endfor

endfunction


