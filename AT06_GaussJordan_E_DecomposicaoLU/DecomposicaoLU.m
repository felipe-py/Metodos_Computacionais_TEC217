function x = DecomposicaoLU(A, b)

  n = size(A, 1);
  L = eye(n);
  U = A;

  fprintf('\n\n\n\n\n\n\n=== Decomposição LU ===\n');
  for k = 1:n-1
    for i = k+1:n
      L(i,k) = U(i,k)/U(k,k);
      U(i,:) = U(i,:) - L(i,k) * U(k,:);
    end
  end

  fprintf('\nMatriz L (inferior):\n');
  disp(L);
  fprintf('\nMatriz U (superior):\n');
  disp(U);

  y = zeros(n,1);
  fprintf('\n=== Resolvendo Ly = b ===\n');
  for i = 1:n
    y(i) = b(i) - L(i,1:i-1)*y(1:i-1);
    fprintf('y(%d) = %.4f\n', i, y(i));
  end

  x = zeros(n,1);
  fprintf('\n=== Resolvendo Ux = y ===\n');
  for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n)*x(i+1:n)) / U(i,i);
    fprintf('x(%d) = %.4f\n', i, x(i));
  end
endfunction

