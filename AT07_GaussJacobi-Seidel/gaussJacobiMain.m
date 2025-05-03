A = [10 3 -2;
     2 8 -1;
     1 1 5];

b = [57; 20; -4];
x0 = [0; 0; 0];
tol = 0.05;
max_iter = 100;

[x, iter] = gaussJacobi(A, b, x0, tol, max_iter);
