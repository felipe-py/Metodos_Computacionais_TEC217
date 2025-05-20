clc;
clear;

graphics_toolkit('gnuplot');  % Estável

% Dados
x_vals = [0, 0.5, 1.0];
f_vals = [1.3, 2.5, 0.9];
n = length(x_vals);

% Para plotagem e estimativa
x_plot = linspace(-2, 3, 200);
y_interp = zeros(size(x_plot));

x_est = 0.8;
y_est = 0;

% Cores para L0, L1, L2
cores = {'b--', 'r--', 'g--'};

figure;
hold on;

for i = 1:n
    Li = ones(size(x_plot));
    Li_est = 1;

    for j = 1:n
        if j ~= i
            Li = Li .* (x_plot - x_vals(j)) / (x_vals(i) - x_vals(j));
            Li_est = Li_est * (x_est - x_vals(j)) / (x_vals(i) - x_vals(j));
        end
    end

    % Soma os termos para o polinômio P2
    y_interp = y_interp + f_vals(i) * Li;
    y_est = y_est + f_vals(i) * Li_est;

    % Plota L_i(x) (agora corretamente)
    plot(x_plot, Li, cores{i}, 'LineWidth', 1.5);
end

% Plota o polinômio P2(x)
plot(x_plot, y_interp, 'k-', 'LineWidth', 2);

% Marca f(0.8)
plot(x_est, y_est, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');

legend('L_0(x)', 'L_1(x)', 'L_2(x)', 'P_2(x)', 'f(0.8)', 'Location', 'northwest');
xlabel('x');
ylabel('y');
title('Interpolação de Lagrange: P_2(x) e polinômios base L_i(x)');
grid on;
hold off;

fprintf("f(%.1f) ≈ %.4f\n", x_est, y_est);

