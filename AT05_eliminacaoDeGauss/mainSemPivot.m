%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1

% Chamada da função que aplica o algoritmo de eliminação de gauss sem a utilização do
% pivoteamento

a = [2 3 -1;
    4 4 -3;
    2 -3 1];

b = [5 3 -1];

x = eliminacaoDeGauss(a,b);

for i=1:length(x)
  printf("x(%d): %.4f\n",i,x(i))
endfor
