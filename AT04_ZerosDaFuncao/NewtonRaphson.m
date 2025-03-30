% DISCENTE: Luis Felipe Cunha Silva
% MATRÍCULA: 22211309
% Métodos Computacionais - TEC217 2025.1

% Encontrando a menor raiz em módulo da função f(x) = x² - 3x + e^x - 2, utilizando o método de Newton-Raphson e com tolerância de
% erro de 10⁻⁴%

f = @(x) x^2 - 3*x + e^x - 2;    % Função f(x) original
g = @(z) 2*z - 3 + e^z;   % Derivada da função f(x)

N = 20;  % Número limite de iterações
erro = 1e-6;   % Tolerância de erro definida
xr = -0.2500; % Valor inicial de xr, determinado pelo ponto médio do intervalo que será trabalhado, [-0.5;0]
ea = inf;    % Definindo erro inicial como infinito, para inicialização da variável
vet_raizes = [];

for i = 1:N + 1   
  
  fxr = f(xr);   % Calculando f(xr)
  aux = xr;      % Valor anterior de xr
  xr = aux - (f(xr)/g(xr));  % Atualiza o valor xr utilizando método de Newton-Raphson
  ea = abs(xr - aux);  % Cálculo do erro utilizando o valor atual de xr subtraindo o valor anterior dele

  fprintf("\nIteração: %d     x%d: %.6f     f(x%d): %.6f     Ea: %.6f\n", i, i, xr, i, fxr, ea);
  
  vet_raizes(i) = xr;
  
  if ea < erro   % Caso o erro aproximado seja menor que a tolerância, o programa será encerrado
    break;
  endif
  
endfor


fprintf("\nMódulo da menor raiz aproximada igual a %.6f\n", abs(xr));


% Plotando gráfico que relaciona iterações com progressão das raízes
x = 1:length(vet_raizes);
plot(x, vet_raizes, '-o');
title("Progressão das raízes ao longo das iterações");
xlabel("Iterações");
ylabel("Raízes");
grid on;