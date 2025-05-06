function [x, iter] = gaussJacobi_2(A, b, x0, tol, max_iter)
  n = length(b);
  x = x0;
  iter = 0;

  % Verificação da diagonal dominante
  fprintf('\n--- Verificando critério de convergência (diagonal dominante) ---\n');
  convergente_diag = true;
  for i = 1:n
    soma = sum(abs(A(i, :))) - abs(A(i, i));
    if abs(A(i, i)) <= soma
      convergente_diag = false;
      fprintf('Linha %d: |a_%d%d| = %.4f <= soma dos demais = %.4f --> NÃO atende\n', ...
              i, i, i, abs(A(i,i)), soma);
    else
      fprintf('Linha %d: |a_%d%d| = %.4f > soma dos demais = %.4f --> OK\n', ...
              i, i, i, abs(A(i,i)), soma);
    end
  end

  if ~convergente_diag
    fprintf('\n  Aviso: O critério de **diagonal dominante** não é satisfeito.\n');
  else
    fprintf('\n Critério de diagonal dominante satisfeito. Prosseguindo...\n');
  end

  % Verificação do raio espectral
  fprintf('\n--- Verificando critério espectral (ρ(T) < 1) ---\n');
  D = diag(diag(A));
  L = tril(A, -1);
  U = triu(A, 1);
  T = -inv(D) * (L + U);
  rho = max(abs(eig(T)));
  fprintf('Raio espectral ρ(T) = %.6f\n', rho);
  if rho < 1
    fprintf(' O método de Jacobi CONVERGE (ρ(T) < 1).\n');
  else
    fprintf(' O método de Jacobi PODE NÃO CONVERGIR (ρ(T) >= 1).\n');
  end

  % Iterações do método
  fprintf('\n--- Iniciando o método de Gauss-Jacobi ---\n');
  fprintf('Tolerância relativa: %.4f\n', tol);
  fprintf('Chute inicial: x = [');
  fprintf('%.4f ', x0);
  fprintf(']\n\n');

  while iter < max_iter
    x_new = zeros(n, 1);
    fprintf('\nIteração %d:\n', iter + 1);

    for i = 1:n
      soma = 0;
      fprintf('  x_%d = (b_%d - (', i, i);
      for j = 1:n
        if j ~= i
          fprintf('%+.4f * %.4f ', A(i,j), x(j));
          soma = soma + A(i,j) * x(j);
        end
      end
      x_new(i) = (b(i) - soma) / A(i,i);
      fprintf(')) / %.4f = %.6f\n', A(i,i), x_new(i));
    end

    numerador = norm(x_new - x, inf);
    denominador = norm(x_new, inf);
    dr = numerador / denominador;
    fprintf('  -> x = [');
    fprintf('%.6f ', x_new);
    fprintf('], dr = %.6f\n', dr);

    if dr < tol
      fprintf('\n Convergência atingida (dr < tolerância).\n');
      break;
    end

    x = x_new;
    iter = iter + 1;
  end

  if iter == max_iter
    fprintf('\n️  Aviso: número máximo de iterações atingido!\n');
  end

  fprintf('\n--- Fim do método ---\n');
  fprintf('Solução aproximada: x = [');
  fprintf('%.6f ', x_new);
  fprintf(']\n');
  fprintf('Total de iterações: %d\n', iter);
end

