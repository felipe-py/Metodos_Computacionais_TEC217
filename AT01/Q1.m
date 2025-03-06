% DISCENTE: Luis Felipe Cunha Silva
% MATRÍCULA: 22211309
% TEC217 - MÉTODOS COMPUTACIONAIS 2025.1


% Definindo os vetores que armazenam os valores pré-definidos pela atividade
% para os pontos x e y.
vetorX = [2, 2, 0, -3, -2, -1, 0, 0, 2];
vetorY = [0, 1, 3, 1, 0, -2, 0, -2, 2];

% Definindo os vetores que armazenam os resultados que serão obtidos para raio
% e ângulos a partir dos pontos definidos anteriormente.
vetor_raio = zeros(1, 9);
vetor_angulo = zeros(1, 9);


% CÁLCULO DO R

% Iterando com base no vetor x para calcular o r, o resultado é diretamente
% alocado no índice do vetor raio que corresponde ao caso X e Y calculado.
for i=1:length(vetorX)
  vetor_raio(i) = sqrt((vetorX(i)^2 + vetorY(i)^2));
end


% CÁLCULO DO Ø

% Iterando com base no vetor x para calcular o Ø,, o resultado é diretamente
% alocado no índice do vetor ângulo em graus que corresponde ao caso X e Y calculado.
for i=1:length(vetorX)

% Avaliando os casos de Y quando X é menor que 0, o resultado é alocado ao índice do vetor_angulo
% que corresponde ao caso calculado. O resultado é calculado em graus e pi tambem é calculado como
% 180°
  if vetorX(i) < 0

    if vetorY(i) > 0
      vetor_angulo(i) = atand(vetorY(i) / vetorX(i)) + 180;

    elseif vetorY(i) < 0
      vetor_angulo(i) = atand(vetorY(i) / vetorX(i)) - 180;

    else
      vetor_angulo(i) = 180;

    endif

% Estudando os casos de Y em que X é igual a 0, os resultados são alocados da mesma
% forma que a anterior, em graus.
  elseif vetorX(i) == 0

    if vetorY(i) > 0
      vetor_angulo(i) = 180 / 2;

    elseif vetorY(i) < 0
      vetor_angulo(i) = -180 / 2;

    else
      vetor_angulo(i) = 0;

    endif

% Caso X seja positivo, o resultado é obtido em graus sem nenhuma verificação extra
  else
    vetor_angulo(i) = atand(vetorY(i) / vetorX(i));

  endif

 end

% O print é feito exibindo os pontos (X e Y), e os resultados obtidos para raio e ângulo
% em cada caso
for i=1:length(vetorX)
  fprintf('X = %d  Y = %d\n r = %.3f\n A = %.1f°\n\n', vetorX(i), vetorY(i), vetor_raio(i), vetor_angulo(i));
end
