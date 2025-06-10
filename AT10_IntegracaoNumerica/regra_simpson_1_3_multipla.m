% Arquivo: regra_simpson_1_3_multipla.m
function I = regra_simpson_1_3_multipla(f, a, b, n)
  h = (b - a) / n;
  soma_impares = 0;
  for i = 1:2:(n-1)
    x_i = a + i * h;
    soma_impares = soma_impares + f(x_i);
  end
  soma_pares = 0;
  for j = 2:2:(n-2)
    x_j = a + j * h;
    soma_pares = soma_pares + f(x_j);
  end
  I = (h / 3) * (f(a) + 4 * soma_impares + 2 * soma_pares + f(b));
endfunction
