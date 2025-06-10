% Arquivo: regra_trapezio_simples.m
function I = regra_trapezio_simples(f, a, b)
  I = (b - a) * (f(a) + f(b)) / 2;
endfunction
