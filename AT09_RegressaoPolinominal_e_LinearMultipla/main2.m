% --- Atividade 2: Regressão Linear Múltipla ---

% Dados
x1_dados = [0; 2; 2.5; 1; 4; 7];
x2_dados = [0; 1; 2; 3; 6; 2];
y_resposta = [5; 10; 9; 0; 3; 27];

X_matriz_entrada = [x1_dados, x2_dados];

fprintf("--- Resultados da Regressão Linear Múltipla (Atividade 2) ---\n");

% Obtenção dos coeficientes
coeficientes_q2 = RegressaoLinearMultipla(X_matriz_entrada, y_resposta);

fprintf("Coeficientes (c0, c1 para x1, c2 para x2):\n");
if ~any(isnan(coeficientes_q2))
    fprintf("  c0 (Intercepto) = %s\n", num2str(coeficientes_q2(1), '%.6g'));
    fprintf("  c1 (para x1)    = %s\n", num2str(coeficientes_q2(2), '%.6g'));
    fprintf("  c2 (para x2)    = %s\n", num2str(coeficientes_q2(3), '%.6g'));

    % Traçar o gráfico da função de ajuste e os pontos
    fprintf("\nGerando gráfico 3D...\n");
    figure;
    scatter3(x1_dados, x2_dados, y_resposta, 60, 'k', 'filled', 'DisplayName', 'Dados Originais');
    hold on;

    x1_grade_vals = linspace(min(x1_dados), max(x1_dados), 15);
    x2_grade_vals = linspace(min(x2_dados), max(x2_dados), 15);
    [X1_p, X2_p] = meshgrid(x1_grade_vals, x2_grade_vals);

    Y_plano_ajuste = coeficientes_q2(1) + coeficientes_q2(2) * X1_p + coeficientes_q2(3) * X2_p;

    surf(X1_p, X2_p, Y_plano_ajuste, 'FaceAlpha', 0.6, 'EdgeColor', 'interp', 'DisplayName', 'Plano de Ajuste');

    xlabel('x1');
    ylabel('x2');
    zlabel('y');
    title('Regressão Linear Múltipla');
    legend('Dados originais', 'Location', 'best');
    grid on;
    rotate3d on;
    hold off;
else
    fprintf("Não foi possível calcular os coeficientes (verifique se há pivôs zero ou sistema singular).\n");
endif
