% DISCENTE: Luis Felipe Cunha Silva
% MATRÍCULA: 22211309
% Métodos Computacionais - TEC217 2025.1

% Encontrando a menor raiz em módulo da função f(x) = x² - 3x + e^x - 2, utilizando o método do ponto fixo e com tolerância de
% erro de 10⁻⁴%

f = @(x) x^2 - 3*x + e^x - 2;    % Função f(x) original
g = @(z) (z^2 + e^z - 2) / 3;     % Função de iteração g(x), definidada isolando 3x da função original
x0 = 0;          % Chute inicial dentro do intervalo [-0.5;0]
erro = 1e-6;   % Tolerância de erro definida
ea = inf;    % Definindo erro inicial como infinito, para inicialização da variável
N = 20;   % Limite de iterações

xr = f(0);    % Calcualndo inicialmente o f(Chute inicial)
iter = 0;  % Inicializando as iterações

vet_raizes = [];  % Definindo vetor que armazenará as raízes que forem sendo calculadas

fprintf("\n\nENCONTRANDO RAIZ DA FUNÇÃO COM O MÉTODO DO PONTO FIXO\n\n");
fprintf("iterações: %d     x0: %.6f     xr: %.6f     ea: %.6f\n", iter, xr, x0, ea);

while iter <= N
  x0 = g(x0);  % Definindo o novo valor de x0 após o chute inicial
  aux = xr;  % aux representa o valor de xr anterior, utilizado no cálculo do erro aproximado
  xr = f(x0); % Definindo o novo valor de xr após o cálculo de x0
  iter = iter + 1;
  
  if xr ~= 0.0
    ea = abs(xr - aux);   % Verificando o erro aproximado, não fica necessário multiplicar por 100. Este processo já foi feito
                                     % na inicialização da variável erro.
  endif
  
  fprintf("iterações: %d     x0: %.6f     xr: %.6f     ea: %.6f\n", iter, xr, x0, ea);
  vet_raizes(iter + 1) = x0;
  
  if ea < erro
    break;   % Interrompendo o programa caso o erro aproximado seja menor que a tolerância
  endif   

endwhile

fprintf("\nMódulo da menor raiz aproximada encontrada = %.6f\n", abs(x0))

% Caso o número de iterações ultrapasse o limite, uma mensagem deve ser mostrada
if iter > N
  error("Limite no número de iterações foi atingido");
endif


% Plotando gráfico que relaciona iterações com progressão das raízes
x = 1:length(vet_raizes);
plot(x, vet_raizes, '-o');
title("Progressão das raízes ao longo das iterações");
xlabel("Iterações");
ylabel("Raízes");
grid on;