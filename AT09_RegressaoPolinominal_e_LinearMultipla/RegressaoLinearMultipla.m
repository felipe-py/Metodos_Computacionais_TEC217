function coef = RegressaoLinearMultipla(x_obs, y_obs)

  n_pontos = size(x_obs, 1);
  num_vars_indep = size(x_obs, 2);

  X_design = [ones(n_pontos, 1), x_obs]; % Adiciona coluna de 1s para c0

  m_coefs = num_vars_indep + 1; % Número total de coeficientes (c0, c1, ..., ck)
  A_sist = zeros(m_coefs, m_coefs);
  B_sist = zeros(m_coefs, 1);

  % Montagem da Matriz A (A = X_design' * X_design, mas com loops)
  for i_linha = 1:m_coefs
    for j_coluna = 1:m_coefs
      soma_atual_A = 0;
      for k_ponto = 1:n_pontos
        soma_atual_A = soma_atual_A + X_design(k_ponto, i_linha) * X_design(k_ponto, j_coluna);
      endfor
      A_sist(i_linha, j_coluna) = soma_atual_A;
    endfor
  endfor

  % Montagem do Vetor B (B = X_design' * y_obs, mas com loops)
  for i_linha = 1:m_coefs
    soma_atual_B = 0;
    for k_ponto = 1:n_pontos
      soma_atual_B = soma_atual_B + X_design(k_ponto, i_linha) * y_obs(k_ponto);
    endfor
    B_sist(i_linha) = soma_atual_B;
  endfor

  % Resolução do Sistema Linear A_sist * coef = B_sist
  % (Eliminação Gaussiana e Substituição Reversa)
  % (Esta parte é idêntica à que você usou na RegressaoPolinomial)

  % Eliminação Gaussiana
  for k_pivot = 1:m_coefs-1
    for i_linha = k_pivot+1:m_coefs
      fator_pv = A_sist(i_linha, k_pivot) / A_sist(k_pivot, k_pivot);
      for j_coluna = k_pivot:m_coefs % Começa de k_pivot para atualizar a linha toda
        A_sist(i_linha, j_coluna) = A_sist(i_linha, j_coluna) - fator_pv * A_sist(k_pivot, j_coluna);
      end
      B_sist(i_linha) = B_sist(i_linha) - fator_pv * B_sist(k_pivot);
    endfor
  endfor

  % Substituição Reversa
  coef = zeros(m_coefs, 1);
  coef(m_coefs) = B_sist(m_coefs) / A_sist(m_coefs, m_coefs);
  for i_linha = m_coefs-1:-1:1
    soma_parcial = 0;
    for j_coluna = i_linha+1:m_coefs
      soma_parcial = soma_parcial + A_sist(i_linha, j_coluna) * coef(j_coluna);
    endfor
    coef(i_linha) = (B_sist(i_linha) - soma_parcial) / A_sist(i_linha, i_linha);
  endfor

endfunction
