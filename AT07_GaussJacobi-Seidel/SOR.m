function [x, iter] = SOR(A, b, x0, tol, max_iter, omega)
  n = length(b);
  x = x0;

  if omega <= 0 || omega >= 2
    fprintf('\n️  Valor de omega inválido! ω deve estar entre 0 e 2 (exclusivo).\n');
    return;
  end

  % Verifica critério de Sassenfeld
  beta = zeros(n, 1);
  for i = 1:n
    soma = 0;
    for j = 1:n
      if j ~= i
        if j < i
          soma = soma + abs(A(i,j)) * beta(j);
        else
          soma = soma + abs(A(i,j));
        end
      end
    end
    beta(i) = soma / abs(A(i,i));
  end

  fprintf('\n--- Verificação do critério de Seidel (Sassenfeld) ---\n\n');
  for i = 1:n
    fprintf('β_%d = %.4f\n', i, beta(i));
  end
  if max(beta) < 1
    fprintf('\n Critério de Sassenfeld satisfeito: o método deve convergir.\n');
  else
    fprintf('️  Critério de Sassenfeld NÃO satisfeito! Convergência não garantida.\n');
  end

  fprintf('\n--- Iniciando o método SOR ---\n\n');
  fprintf('Tolerância relativa: %.4f\n', tol);
  fprintf('Parâmetro de relaxação ω = %.2f\n', omega);
  fprintf('Chute inicial: x = [');
  fprintf('%.4f ', x0);
  fprintf(']\n\n');

  iter = 0;
  while iter < max_iter
    x_old = x;
    fprintf('\nIteração %d:\n', iter + 1);

    for i = 1:n
      soma = 0;
      for j = 1:n
        if j ~= i
          soma = soma + A(i,j) * x(j);
        end
      end
      x_old_i = x(i); % guardar valor antigo
      x(i) = (1 - omega) * x(i) + (omega / A(i,i)) * (b(i) - soma);

      fprintf('  x_%d = (1 - %.2f)*%.6f + (%.2f/%.4f)*(%.4f - %.4f) = %.6f\n', ...
              i, omega, x_old_i, omega, A(i,i), b(i), soma, x(i));
    end

    numerador = norm(x - x_old, inf);
    denominador = norm(x, inf);
    dr = numerador / denominador;
    fprintf('\n  -> x = [');
    fprintf('%.6f ', x);
    fprintf('], dr = %.6f\n\n', dr);

    if dr < tol
      fprintf('\n Convergência atingida (dr < tolerância).\n');
      break;
    end

    iter = iter + 1;
  end

  if iter == max_iter
    fprintf('\n  Aviso: número máximo de iterações atingido!\n');
  end

  fprintf('\n--- Fim do método ---\n');
  fprintf('Solução aproximada: x = [');
  fprintf('%.6f ', x);
  fprintf(']\n');
  fprintf('Total de iterações: %d\n', iter);
end

