clc;
clear;

tic;
% ----- Funções auxiliares -----
function print_matrix(M)
    [rows, cols] = size(M);
    for i = 1:rows
        for j = 1:cols
            fprintf('%8.4f ', M(i,j));
        end
        fprintf('\n');
    end
    fprintf('\n');
end

function print_vector(v)
    for i = 1:length(v)
        fprintf('x(%d) = %.6f\n', i, v(i));
    end
end

A = [ 4 -1 -1  0;
     -1  4  0 -1;
     -1  0  4 -1;
      0 -1 -1  4 ];

b = [175; 100; 75; 0];

fprintf('\n=== MÉTODO DA DECOMPOSIÇÃO LU ===\n');

[L, U] = lu(A);

fprintf('\nMatriz L:\n');
print_matrix(L);

fprintf('Matriz U:\n');
print_matrix(U);

% Substituição direta (Ly = b)
n = length(b);
y = zeros(n,1);
for i = 1:n
    y(i) = b(i) - L(i,1:i-1) * y(1:i-1);
end

fprintf('\nSolução intermediária (y) de Ly = b:\n');
print_vector(y);

% Substituição reversa (Ux = y)
x_lu = zeros(n,1);
for i = n:-1:1
    x_lu(i) = (y(i) - U(i,i+1:end) * x_lu(i+1:end)) / U(i,i);
end

fprintf('\nSolução final (LU):\n');
print_vector(x_lu);

tempo = toc;
disp(tempo)



