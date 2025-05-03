function [x, iter] = gaussJacobi(A, b, x0, tol, max_iter)
  n = length(b);
  x = x0;
  iter = 0;

  fprintf('\n--- Iniciando o método de Gauss-Jacobi ---\n');
  fprintf('Tolerância relativa: %.4f\n', tol);
  fprintf('Chute inicial: x = [%.4f, %.4f, %.4f]\n\n', x0);

  while iter < max_iter
    x_new = zeros(n, 1);
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
      x_new(i) = (b(i) - soma) / A(i,i);
      fprintf(')) / %.4f = %.6f\n', A(i,i), x_new(i));
    end

    numerador = norm(x_new - x, inf);
    denominador = norm(x_new, inf);
    dr = numerador / denominador;
    fprintf('  -> x = [%.6f, %.6f, %.6f], dr = %.6f\n', x_new, dr);

    if dr < tol
      fprintf('\nConvergência atingida (dr < tolerância).\n');
      break;
    endif

    x = x_new;
    iter += 1;
  endwhile

  if iter == max_iter
    fprintf('\nAviso: número máximo de iterações atingido!\n');
  endif

  fprintf('\n--- Fim do método ---\n');
  fprintf('Solução aproximada: x = [%.6f, %.6f, %.6f]\n', x_new);
  fprintf('Total de iterações: %d\n', iter);
end
