clc;
clear;

% Define o backend gráfico
graphics_toolkit('gnuplot');

% Define a função f(x) (originalmente L0)
f = @(x) 1 - exp(-x);

% Limites de integração
a = 0;
b = 4;

% Calcula os valores da função nos limites
f_a = f(a);
f_b = f(b);

% Gera valores de x para a curva suave da função original
x_curva = linspace(a, b, 200);
y_curva = f(x_curva);

% Gera os pontos para a reta p(x) que forma o topo do trapézio
x_reta_trapezio = [a, b];
y_reta_trapezio = [f_a, f_b];

% Plota a função original
figure;
plot(x_curva, y_curva, 'b-', 'LineWidth', 2, 'DisplayName', 'f(x) = 1 - e^{-x}');
hold on;

% Plota a reta p(x)
plot(x_reta_trapezio, y_reta_trapezio, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Reta de Aproximação p(x)');

% Define os vértices do trapézio para preenchimento
x_vertices_trapezio = [a, b, b, a];
y_vertices_trapezio = [0, 0, f_b, f_a];

% Desenha e preenche o trapézio com uma cor semi-transparente
fill(x_vertices_trapezio, y_vertices_trapezio, 'r', 'FaceAlpha', 0.2, 'DisplayName', 'Área do Trapézio (Aproximação)');

% Plota os pontos (a, f(a)) e (b, f(b)) para destaque
plot([a, b], [f_a, f_b], 'ro', 'MarkerFaceColor', 'r', 'HandleVisibility', 'off');

% Configurações do gráfico
xlabel('x');
ylabel('y');
title('Visualização da Regra do Trapézio');
legend('show', 'Location', 'northwest');
grid on;
axis([a, b, 0, 1]); % Ajusta os eixos para uma melhor visualização

hold off;

