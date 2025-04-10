%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1

% Chamada da função que aplica o algoritmo de eliminação de gauss sem a utilização do
% pivoteamento

a = [10 2 -1;
    -3 -5 2;
    1 1 6;
    ];

b = [27 -61.5 -21.5];

x = eliminacaoDeGauss(a,b);

for i=1:length(x)
  printf("x(%d): %.4f\n",i,x(i))
endfor
