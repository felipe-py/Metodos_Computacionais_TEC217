function [x, iter] = gaussJacobi(A, b, x0, tol, max_iter)
  n = length(b);
  x = x0;
  iter = 0;

  % Verificação do critério de convergência
  fprintf('\n--- Verificando critério de convergência (diagonal dominante) ---\n');
  convergente = true;
  for i = 1:n
    soma = sum(abs(A(i, :))) - abs(A(i, i));
    if abs(A(i, i)) <= soma
      convergente = false;
      fprintf('Linha %d: |A_%d%d| = %.4f <= soma dos demais = %.4f --> NÃO atende\n', i, i, i, abs(A(i,i)), soma);
    else
      fprintf('Linha %d: |A_%d%d| = %.4f > soma dos demais = %.4f --> OK\n', i, i, i, abs(A(i,i)), soma);
    end
  end

  if ~convergente
    fprintf('\nAviso: O critério de convergência **não** é satisfeito.\n');
    fprintf('O método pode não convergir!\n');
  else
    fprintf('\nCritério de convergência satisfeito. Prosseguindo com o método...\n');
  end

  fprintf('\n\n   --- Iniciando o método de Gauss-Jacobi ---\n\n');
  fprintf('Tolerância relativa: %.4f\n', tol);
  fprintf('Chute inicial: x = [%.4f, %.4f, %.4f]\n\n', x0);

  while iter < max_iter
    x_novo = zeros(n, 1);
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
      x_novo(i) = (b(i) - soma) / A(i,i);
      fprintf(')) / %.4f = %.6f\n', A(i,i), x_novo(i));
    end

    numerador = norm(x_novo - x, inf);
    denominador = norm(x_novo, inf);
    dr = numerador / denominador;
    fprintf('  \n-> x = [%.6f, %.6f, %.6f], dr = %.6f\n\n', x_novo, dr);

    if dr < tol
      fprintf('\nConvergência atingida (dr < tolerância).\n');
      break;
    endif

    x = x_novo;
    iter += 1;
  endwhile

  if iter == max_iter
    fprintf('\nAviso: número máximo de iterações atingido!\n');
  endif

  fprintf('\n--- Fim do método ---\n');
  fprintf('Solução aproximada: x = [%.6f, %.6f, %.6f]\n', x_novo);
  fprintf('Total de iterações: %d\n', iter);
end
