clc;
clear;

% Define o backend gráfico mais estável
graphics_toolkit('gnuplot');  % Evita travamentos em sistemas com problemas de OpenGL

% Define as funções Li
L0 = @(x) (x.^2-1.5*x+0.5)/0.5;
L1 = @(x) (x.^2-x)/-0.25;
L2 = @(x) (x.^2-0.5*x)/0.5;
P2 = @(x) 1.3*((x.^2-1.5*x+0.5)/0.5)+2.5*((x.^2-x)/-0.25)+0.9*((x.^2-0.5*x)/0.5);
r1 = L0(0.8)
r2 = L1(0.8)
r3 = L2(0.8)
P2(0.8)
1.3*r1+2.5*r2+0.9*r3

% Gera valores de x
x = linspace(-2, 3, 200);

% Calcula os valores de y para cada função
y_l0 = L0(x);
y_l1 = L1(x);
y_l2 = L2(x);
y_p2 = P2(x);

% Plota as duas funções no mesmo gráfico
figure;

% Primeira curva: L0(x)
plot(x, y_l0, 'b-', 'LineWidth', 2);
hold on;  % Permite adicionar mais curvas ao mesmo gráfico

% Segunda curva: L1(x)
plot(x, y_l1, 'r-', 'LineWidth', 2);

% Terceira curva: L2(x)
plot(x, y_l2, 'k-', 'LineWidth', 2);

% Quarta curva: P2(x)
plot(x, y_p2, 'g-', 'LineWidth', 2);

% Configurações do gráfico
xlabel('x');
ylabel('y');
title('Comparação entre L1, L2, L3 e P2(x)');
legend('L0(x)', 'L1(x)', 'L2(x)', 'P2(x)', 'Location', 'northwest');
grid on;

% Mantém o gráfico na tela
hold off;

