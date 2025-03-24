% DISCENTE: Luis Felipe Cunha Silva
% MATRÍCULA: 22211309
% TEC 217 - MÉTODOS COMPUTACIONAIS 2025.1

% Script que utiliza o método da falsa posição para calcular a raiz aproximada da função
% f(x) = x³ - 9x + 3, no intervalo [0 , 1]


% Inicializando as variáveis principais que serão utilizadas, limite inferior, superior, 
% tolerância de erro, número máximo de iterações e o vetor que armazenará as raízes
% que forem encontradas.
a = 0;
b = 1;
erro = 0.001;
max_iter = 20;
vet_raizes = [];

% Calculando f(a) e f(b) para verificação da mudança de sinal.
fa = a^3 - 9 * a + 3;
fb = b^3 - 9 * b + 3;

if fa * fb > 0
  printf("Erro: Não há mudança de sinal no intervalo fornecido!\n");
  

% Com a verificação do sinal concluída, entramos no algoritmo do método propriamente dito.
else 
  it = 0;
  r_ant = NaN;  % Variável para armazenar a raiz da iteração anterior

  while true
    % Calculo do r, entre a e b.
    r = ((a * fb) - (b * fa)) / (fb - fa);
    fr = r^3 - 9 * r + 3;

    printf("ITERAÇÃO: %d   |   A: %.4f   |   B: %.4f   |   R: %.4f   |   FA: %.4f   |   FB: %.4f   |   FR: %.4f   |   TINTERV: %.4f\n", it, a, b, r, fa, fb, fr, abs(b-a));

    vet_raizes(it + 1) = r;
    
    % Calculando a tolerância e evitando iterações desnecessárias para valores irrisoriamente pequenos.
    if abs(b - a) < erro || (it > 0 && abs(r - r_ant) < erro)
      printf("\nProcesso finalizado, raiz = %.4f\n", r);
      break;
    end

    if it == max_iter
      printf("Número máximo de iterações atingido\n");
      break;
    end

    % Realizando a troca entre os limites e o ponto médio, a depender da mudança de sinal.
    if fa * fr < 0
      b = r;
      fb = fr;
    else
      a = r;
      fa = fr;
    end

    r_ant = r;  
    it = it + 1;
  endwhile
  
% Plotagem do gráfico de progressão das raízes em relação as iterações.
x = 1:length(vet_raizes);
plot(x, vet_raizes, '-o');
title("Progressão das raízes ao longo das iterações");
xlabel("Iterações");
ylabel("Raízes");
grid on;
  
endif
