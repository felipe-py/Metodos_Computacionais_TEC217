% Arquivo: regra_trapezio_multipla.m
function I = regra_trapezio_multipla(f, a, b, n)
  h = (b - a) / n;
  soma_interna = 0;
  for i = 1:(n-1)
    x_i = a + i * h;
    soma_interna = soma_interna + f(x_i);
  end
  I = (h / 2) * (f(a) + 2 * soma_interna + f(b));
endfunction
