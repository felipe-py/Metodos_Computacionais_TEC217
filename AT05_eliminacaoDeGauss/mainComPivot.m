%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1

% Chamada da função que aplica o algoritmo de eliminação de gauss com a utilização do
% pivoteamento parcial

a = [2 -6 -1;
    -3 -1 7;
    -8 1 -2;

b = [-38 -34 -20];

x = elimGaussPivotParcial(a,b);

fprintf("\n\nRESULTADO FINAL:\n")
for i=1:length(x)
  printf("x(%d): %.4f\n",i,x(i))
endfor
