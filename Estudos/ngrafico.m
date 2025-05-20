clc;
clear;

% Dados fornecidos
x = [0, 0.5, 1.0];
y = [1.0, 2.12, 3.55];
xx = 0.7;  % ponto onde queremos interpolar

n = length(x);
b = zeros(n, n);
b(:,1) = y(:);  % primeira coluna recebe os valores de y

% Exibindo os dados iniciais
fprintf("===== Dados Iniciais =====\n");
disp('x ='), disp(x);
disp('y ='), disp(y);
fprintf("\n");

% Cálculo das diferenças divididas
fprintf("===== Cálculo das Diferenças Divididas =====\n");
for j = 2:n
    for i = 1:(n - j + 1)
        b(i,j) = (b(i+1,j-1) - b(i,j-1)) / (x(i+j-1) - x(i));
        fprintf("b(%d,%d) = (%.5f - %.5f)/(%.2f - %.2f) = %.5f\n", ...
                i, j, b(i+1,j-1), b(i,j-1), x(i+j-1), x(i), b(i,j));
    end
end

fprintf("\nTabela completa de Diferenças Divididas:\n");
disp(b);

% Interpolação no ponto desejado usando fórmula de Newton
fprintf("\n===== Interpolando f(%.2f) com Newton =====\n", xx);
xt = 1;
yint = b(1,1);
fprintf("Passo 0: yint = b(1,1) = %.5f\n", yint);

for j = 1:(n - 1)
    xt = xt * (xx - x(j));
    termo = b(1,j+1) * xt;
    yint = yint + termo;
    fprintf("Passo %d: xt = %.5f, termo = b(1,%d) * xt = %.5f * %.5f = %.5f, yint = %.5f\n", ...
            j, xt, j+1, b(1,j+1), xt, termo, yint);
end

fprintf("\n>>> Valor final interpolado f(%.2f) = %.6f\n", xx, yint);

% Gerando gráfico do polinômio
xg = linspace(-1, 2, 200);
yg = zeros(size(xg));
for k = 1:length(xg)
    xt = 1;
    yg(k) = b(1,1);
    for j = 1:(n - 1)
        xt = xt * (xg(k) - x(j));
        yg(k) = yg(k) + b(1,j+1) * xt;
    end
end

% Plotagem
figure;
plot(xg, yg, 'b-', 'LineWidth', 2); hold on;
plot(x, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
plot(xx, yint, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
xlabel('x'); ylabel('y');
title('Interpolação de Newton');
legend('P_2(x)', 'Pontos da Tabela', sprintf('f(%.1f) Interpolado', xx), 'Location', 'northwest');
grid on;


