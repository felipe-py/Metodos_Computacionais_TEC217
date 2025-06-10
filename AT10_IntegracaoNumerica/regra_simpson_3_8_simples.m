% Arquivo: regra_simpson_3_8_simples.m
function I = regra_simpson_3_8_simples(f, a, b)
  h = (b - a) / 3;
  x1 = a + h;
  x2 = a + 2 * h;
  I = (3 * h / 8) * (f(a) + 3 * f(x1) + 3 * f(x2) + f(b));
endfunction
