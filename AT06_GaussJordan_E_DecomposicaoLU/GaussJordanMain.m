%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1

% Chamada da função que implementa o algoritmo de GaussJordan

a = [-0.04 0.04 0.12;
    0.56 -1.56 0.32;
    -0.24 1.24 -0.28;];

b = [3 1 0];

x = EliminacaoGaussJordan(a,b);

fprintf("\n\nRESULTADO FINAL:\n")
for i=1:length(x)
  printf("x(%d): %.4f\n",i,x(i))
endfor
