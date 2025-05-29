% --- Dados da Atividade 1 ---
x_dados = [0 1 2 3 4 5];
y_dados = [0 20 60 68 77 100];
n_dados = length(x_dados);

% --- Inicialização para Plotagem ---
figure; % Cria uma nova figura para todos os plots
plot(x_dados, y_dados, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8, 'DisplayName', 'Dados Originais');
hold on; % Permite adicionar mais plots à mesma figura
cores = {'r-', 'g-', 'b-', 'm-', 'c-'}; % Cores para os diferentes graus
legend_entries = {'Dados Originais'}; % Inicia a lista de legendas

fprintf("--- Análise de Regressão Polinomial (Graus 1 a 5) ---\n");

% --- Loop para testar diferentes graus de polinômio ---
for grau_g = 1:5
  fprintf('\n\n--- Grau do Polinômio: %d ---\n', grau_g);

  % 1. Obter os coeficientes do polinômio
  coeficientes = RegressaoPolinomial(x_dados, y_dados, grau_g);

  if any(isnan(coeficientes)) % Verifica se a solução do sistema falhou
      fprintf("Não foi possível obter coeficientes para o grau %d (pivô zero ou sistema singular).\n", grau_g);
      legend_entries{end+1} = sprintf('Grau %d (falhou)', grau_g); % Adiciona entrada à legenda
      continue; % Pula para o próximo grau
  endif

  % Imprime os coeficientes com alta precisão
  fprintf("Coeficientes (c0 a c%d):\n", grau_g);
  for k_coef = 1:length(coeficientes)
    fprintf("  c%d = %s\n", k_coef-1, num2str(coeficientes(k_coef), '%.17g'));
  endfor

  % 2. Calcular os valores preditos (y_hat) para os x_dados originais
  %    (Usando uma função auxiliar para avaliar o polinômio)
  y_preditos_nos_dados = zeros(size(x_dados));
  for idx_termo = 1:length(coeficientes)
    potencia_x = idx_termo - 1;
    y_preditos_nos_dados = y_preditos_nos_dados + coeficientes(idx_termo) * (x_dados .^ potencia_x);
  endfor

  % 3. Calcular o Coeficiente de Determinação (r^2)
  media_y = sum(y_dados)/n_dados; % Ou mean(y_dados)
  St = sum((y_dados - media_y).^2); % Soma dos Quadrados Total
  Sr = sum((y_dados - y_preditos_nos_dados).^2); % Soma dos Quadrados dos Resíduos

  r_quadrado = -Inf; % Valor padrão caso St seja zero e Sr não
  if St == 0
    if Sr < 1e-9 % Se St e Sr são (praticamente) zero, ajuste perfeito de uma constante
      r_quadrado = 1.0;
    else % Se St é zero mas Sr não é (modelo previu algo diferente da constante y)
      r_quadrado = 0.0; % Ou poderia ser definido como NaN ou -Inf dependendo da convenção
    end
  else
    r_quadrado = 1 - (Sr / St);
  endif
  fprintf("Coeficiente de Determinação (r^2): %.4f\n", r_quadrado);
  fprintf("\nSt: %.4f\nSr: %.4f", St, Sr);

  % 4. Plotar a curva de ajuste do polinômio atual
  %    Gera pontos x para uma curva suave
  if min(x_dados) == max(x_dados) % Caso especial: todos os x são iguais
      x_plot = ones(1,2)*min(x_dados); % Linha vertical não pode ser plotada assim
      y_plot_ajuste = ones(1,2)*y_preditos_nos_dados(1); % Linha horizontal
  else
      x_plot = linspace(min(x_dados), max(x_dados), 200);
  endif

  y_plot_ajuste = zeros(size(x_plot));
  for idx_termo = 1:length(coeficientes)
    potencia_x = idx_termo - 1;
    y_plot_ajuste = y_plot_ajuste + coeficientes(idx_termo) * (x_plot .^ potencia_x);
  endfor

  plot(x_plot, y_plot_ajuste, cores{grau_g}, 'LineWidth', 1.5, 'DisplayName', sprintf('Grau %d (r^2=%.3f)', grau_g, r_quadrado));
  legend_entries{end+1} = sprintf('Grau %d (r^2=%.3f)', grau_g, r_quadrado); % Atualiza para usar no legend final

endfor

% --- Finalização do Gráfico ---
xlabel('X');
ylabel('Y');
title('Ajustes Polinomiais (Graus 1 a 5) e Dados Originais');
legend(legend_entries(1:end), 'Location', 'northwest'); % Usa as legend_entries a partir do segundo (o primeiro é 'Dados Originais' já tratado pelo DisplayName)
                                                        % ou simplesmente `legend show;` se todos usarem DisplayName
grid on;
hold off;

fprintf("\nAnálise visual e dos valores de r^2 determinarão qual grau de polinômio foi o melhor.\n");
