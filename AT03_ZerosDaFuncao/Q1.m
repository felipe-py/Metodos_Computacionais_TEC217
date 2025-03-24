% DISCENTE: Luis Felipe Cunha Silva
% MATRÍCULA: 22211309
% TEC 217 - MÉTODOS COMPUTACIONAIS 2025.1

% Script que utiliza o método da bissecção para calcular a raiz aproximada da função
% f(x) = sen(x) - (x)², no intervalo [0.5 , 1]


% Inicializando as variáveis principais que serão utilizadas, limite inferior, superior, 
% tolerância de erro, número máximo de iterações e o vetor que armazenará as raízes
% que forem encontradas.
a = 0.5;
b = 1;
erro = 0.02;
max_iter = 20;
vet_raizes = [];

% Calculando f(a) e f(b) para verificação da mudança de sinal.
fa = sin(a) - (a^2);
fb = sin(b) - (b^2);

if fa * fb > 0
  printf("Erro: Não há mudança de sinal no intervalo fornecido!\n");
  
% Com a verificação do sinal concluída, entramos no algoritmo do método propriamente dito.
else 
  it = 0;
  while true
    % Calculando o ponto médio entre a e b.
    r = (a + b) / 2;
    fr = sin(r) - (r^2);

    printf("ITERAÇÃO: %d   |   A: %.4f   |   B: %.4f   |   R: %.4f   |   FA: %.4f   |   FB: %.4f   |   FR: %.4f   |   TINTERV: %.4f\n", it, a, b, r, fa, fb, fr, abs(b-a));
    vet_raizes(it + 1) = r;
    
    % Calculando a tolerância e evitando iterações desnecessárias para valores irrisoriamente pequenos
    if abs(b - a) < erro
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
   
    it = it + 1;
  endwhile

% Plotagem do gráfico de progressão das raízes em relação as iterações.
x = 1:length(vet_raizes);
plot(x, vet_raizes, '-o');
title("Progressão das raízes ao longo das iterações");
xlabel("Raízes");
ylabel("Iterações");
grid on;
  
endif



