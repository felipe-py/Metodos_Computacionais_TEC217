function [x, iter] = gaussSeidel_2(A, b, x0, tol, max_iter)
  n = length(b);
  x = x0;

  % Verifica critério de Seidel (Sassenfeld)
  beta = zeros(n, 1);
  for i = 1:n
    soma = 0;
    for j = 1:n
      if j != i
        if j < i
          soma += abs(A(i,j)) * beta(j);
        else
          soma += abs(A(i,j));
        endif
      endif
    end
    beta(i) = soma / abs(A(i,i));
  end

  fprintf('\n--- Verificação do critério de Seidel (Sassenfeld) ---\n');
  for i = 1:n
    fprintf('β_%d = %.4f\n', i, beta(i));
  end
  if max(beta) < 1
    fprintf('Critério de Seidel satisfeito: algoritmo deve convergir.\n');
  else
    fprintf('Aviso: critério de Seidel NÃO satisfeito! Convergência não garantida.\n');
  end

  fprintf('\n--- Iniciando o método de Gauss-Seidel ---\n');
  fprintf('Tolerância relativa: %.4f\n', tol);
  fprintf('Chute inicial: x = [%.4f, %.4f, %.4f, %.4f]\n\n', x0);

  iter = 0;
  while iter < max_iter
    x_old = x;
    fprintf('\nIteração %d:\n', iter + 1);

    for i = 1:n
      soma = 0;
      fprintf('  x_%d = (b_%d - (', i, i);
      for j = 1:n
        if j != i
          fprintf('%+.4f * %.4f ', A(i,j), x(j));
          soma += A(i,j) * x(j);
        endif
      end
      x(i) = (b(i) - soma) / A(i,i);
      fprintf(')) / %.4f = %.6f\n', A(i,i), x(i));
    end

    numerador = norm(x - x_old, inf);
    denominador = norm(x, inf);
    dr = numerador / denominador;
    fprintf('  -> x = [%.6f, %.6f, %.6f, %.6f], dr = %.6f\n', x, dr);

    if dr < tol
      fprintf('\nConvergência atingida (dr < tolerância).\n');
      break;
    endif

    iter += 1;
  endwhile

  if iter == max_iter
    fprintf('\nAviso: número máximo de iterações atingido!\n');
  endif

  fprintf('\n--- Fim do método ---\n');
  fprintf('Solução aproximada: x = [%.6f, %.6f, %.6f, %.6f]\n', x);
  fprintf('Total de iterações: %d\n', iter);
end
