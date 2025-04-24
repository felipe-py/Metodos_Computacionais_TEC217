%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1

% Chamada da função que implementa o método da decomposição LU

A = [2, 1, -3;
      -1, 3, 2;
       3, 1, -3];
  b = [3; 1; 2];

x = DecomposicaoLU(A, b);

fprintf('\n\n\n\n\n=== Solução Final x ===\n\n');
disp(x);
