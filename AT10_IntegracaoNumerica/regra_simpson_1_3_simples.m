% Arquivo: regra_simpson_1_3_simples.m
function I = regra_simpson_1_3_simples(f, a, b)
  h = (b - a) / 2;
  x1 = a + h;
  I = (h / 3) * (f(a) + 4 * f(x1) + f(b));
endfunction
