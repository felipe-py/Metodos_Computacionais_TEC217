clc;
clear;
format long;

% --- Definições Iniciais ---
f = @(x) 1 - exp(-x);
a = 0;
b = 4;
n_multiplo = 4;

fprintf("Cálculo da Integral de f(x) = 1 - e^(-x) de %d a %d\n", a, b);
fprintf("----------------------------------------------------------\n\n");

% a) Cálculo Analítico (Valor Exato)
valor_exato = (b + exp(-b)) - (a + exp(-a));
fprintf("a) Valor Analítico (Exato)......: %.8f\n", valor_exato);
fprintf("----------------------------------------------------------\n");

% --- Cálculos Numéricos e Erros ---
fprintf("   Método Numérico                | Resultado   | Erro Relativo (%%)\n");
fprintf("----------------------------------------------------------\n");

% b) Regra do Trapézio Simples
I_trap_simples = regra_trapezio_simples(f, a, b);
erro_trap_simples = abs((valor_exato - I_trap_simples) / valor_exato) * 100;
fprintf("b) Trapézio Simples (n=1)........: %.8f | %.4f %%\n", I_trap_simples, erro_trap_simples);

% c) Regra do Trapézio Múltipla (n=4)
I_trap_multipla = regra_trapezio_multipla(f, a, b, n_multiplo);
erro_trap_multipla = abs((valor_exato - I_trap_multipla) / valor_exato) * 100;
fprintf("c) Trapézio Múltipla (n=4).......: %.8f | %.4f %%\n", I_trap_multipla, erro_trap_multipla);

fprintf("----------------------------------------------------------\n");

% d) Regra de Simpson 1/3 Simples (n=2)
I_simp13_simples = regra_simpson_1_3_simples(f, a, b);
erro_simp13_simples = abs((valor_exato - I_simp13_simples) / valor_exato) * 100;
fprintf("d) Simpson 1/3 Simples (n=2)....: %.8f | %.4f %%\n", I_simp13_simples, erro_simp13_simples);

% e) Regra de Simpson 1/3 Múltipla (n=4)
I_simp13_multipla = regra_simpson_1_3_multipla(f, a, b, n_multiplo);
erro_simp13_multipla = abs((valor_exato - I_simp13_multipla) / valor_exato) * 100;
fprintf("e) Simpson 1/3 Múltipla (n=4)...: %.8f | %.4f %%\n", I_simp13_multipla, erro_simp13_multipla);

fprintf("----------------------------------------------------------\n");

% f) Regra de Simpson 3/8 Simples (n=3)
I_simp38_simples = regra_simpson_3_8_simples(f, a, b);
erro_simp38_simples = abs((valor_exato - I_simp38_simples) / valor_exato) * 100;
fprintf("f) Simpson 3/8 Simples (n=3)....: %.8f | %.4f %%\n", I_simp38_simples, erro_simp38_simples);

fprintf("----------------------------------------------------------\n");

