%DISCENTE: Luis Felipe Cunha Silva
%MATRÍCULA: 22211309
%MÉTODOS COMPUTACIONAIS - TEC217 2025.1


% Implementação do algoritmo de eliminação de Gauss sem pivoteamento

function x = eliminacaoDeGauss(a,b);

  % Parte 1: Eliminação progressiva

  #{
  Para k = 1 : n-1 % Inicia as eliminações de 1 até n-1
  Para i = k+1 : n % Eliminação para as linhas de k+1 até n
  fator = ai,k / ak,k
  Para j = k : n % realiza a operação dos elementos ao longo da linha
  ai,j = ai,j – fator * ak,j
  Fim Para
  bi = bi – fator * bk
  Fim Para
  Fim Para}
  #}

  % Exemplo de entrada
  a = [2, -1, 1;
       3, 3, 9;
       3, 3, 5]; % matriz dos coeficientes

  b = [2; -1; 4]; % vetor dos termos independentes

  n = length(b); % tamanho do sistema

  for k=1:n-1
    for i=k+1:n
      fator = a(i,k) / a(k,k);
      for j=k:n
        a(i,j) = a(i,j) - fator * a(k,j);
      endfor
      b(i) = b(i) - fator * b(k);
    endfor
  endfor

  % Parte 2: Substituição progressiva

  #{
  Xn = bn / an,n
  Para i = n-1 : -1 : 1 % início da retro-substituição partindo da penúltima linha
  Soma = bi
  Para j = i+1 : n % acumula o somatório para cada x já calculado
  Soma = Soma – ai,j * xj
  Fim Para
  xi = soma / ai,i
  Fim Para
  #}

  x = zeros(n, 1); % vetor solução inicializado

  x(n) = b(n) / a(n,n);
  for i=n-1:-1:1
    soma = b(i);
    for j=i+1:n
      soma = soma - a(i,j) * x(j);
    endfor
    x(i) = soma / a(i,i);
  endfor

