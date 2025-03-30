% DISCENTE: Luis Felipe Cunha Silva
% MATRÍCULA: 22211309
% Métodos Computacionais - TEC217 2025.1

% Encontrando a menor raiz em módulo da função f(x) = x² - 3x + e^x - 2, utilizando o método da secante e com tolerância de
% erro de 10⁻⁴%


f = @(x) x^2 - 3*x + e^x - 2;    % Função f(x) original
erro = 1e-6;   % Tolerância de erro definida
ea = inf;    % Definindo erro inicial como infinito, para inicialização da variável
N = 20;   % Limite de iterações
vet_raizes = [];  % Definindo vetor que armazenará as raízes que forem sendo calculadas

x0 = -0.5;   % Limite inferior do intervalo utilizado para o cálculo da raiz
x1 = 0;   % Limite superior do intervalo utilizado para o cálculo da raiz

for i = 1: N + 1
  
  fx0 = f(x0);  % Cálculo do f de x0
  fx1 = f(x1);  % Cálculo do f de x1
  
  % Calculando o novo x, utilizando o método da secante
  x2 = x1 - (( f(x1) * (x1 - x0) ) / (f(x1) - f(x0)));
  
  ea = abs(x2 - x1);   % Calculando o erro aproximando, a partir do módulo do x atual menos o anterior
  
  fprintf("Iteração: %d     xr: %.8f     f(xr): %.8f     Ea: %.8f\n", i, x2, f(x2), ea);
  
  vet_raizes(i) = x2;
  
  if ea < erro   % Verificando se o critério de parada é atentido
    break;
  endif
  
  % Atualizando os valores de x
  x0 = x1;
  x1 = x2;
 
endfor

fprintf("\nMódulo da menor raiz aproximada encontrada = %.8f\n", abs(x2))


% Plotando gráfico que relaciona iterações com progressão das raízes
x = 1:length(vet_raizes);
plot(x, vet_raizes, '-o');
title("Progressão das raízes ao longo das iterações");
xlabel("Iterações");
ylabel("Raízes");
grid on;
