# Questão 02 gaussSeidel

A = [2 -1 0 0;
     -1 2 -1 0;
     0 -1 2 -1;
     0 0 -1 2];

b = [1; 2; 9; 11];
x0 = [0; 0; 0; 0];
tol = 0.0005;
max_iter = 10;

[x, iter] = gaussSeidel_2(A, b, x0, tol, max_iter);
