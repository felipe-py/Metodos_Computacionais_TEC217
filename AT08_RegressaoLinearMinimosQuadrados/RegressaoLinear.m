## Copyright (C) 2025 Luisl
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} RegressaoLinear (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Luisl <Luisl@ASPIRE5-RYZEN7>
## Created: 2025-05-22

function retval = RegressaoLinear (x, y)

  n = length(x);
  sx = 0;
  sy = 0;
  sx2 = 0;
  sxy = 0;
  sy2 = 0;

  if length(y) ~= n
    error("Tamanho dos vetores diferente");
  endif

  for i=1:n
    sx = sx + x(i);
    sy = sy + y(i);
    sx2 = sx2 + x(i)^2;
    sxy = sxy + x(i) * y(i);
    sy2 = sy2 + y(i)^2;
  endfor
  my = sy/n;
  mx = sx/n;

  c1 = (n*sxy - (sx*sy))/(n*sx2-sx^2);
  c2 = my - (c1*mx);

  st = 0;  % Resíduo em relação a média
  sr = 0;  % Resíduo em relação ao ajuste linear
  syd = 0; % Desvio padrão em relação a média
  sy_sobreX = 0;  % Desvio padrão em relação ao ajuste linear
  r2 = 0;  % Coeficiente de determinação

  for i=1:n
    st = st + ((y(i) - my)^2);
    sr = sr + (y(i) - c2 - c1*x(i))^2;
  endfor
  syd = sqrt(st/(n-1));
  sy_sobreX = sqrt(sr/(n-2));
  r2 = (st-sr)/st;

  fprintf("Tamanho dos vetores: %d\nSomatório X: %.3f\nSomatório Y: %.3f\n", n, sx, sy);
  fprintf("Somatório x²: %.3f\nSomatório y²: %.3f\nSomatório X*Y: %.3f\n", sx2, sy2, sxy);
  fprintf("Média vetor X: %.3f\nMédia vetor Y: %.3f\nCoeficiente C1: %.3f\nCoeficiente C2: %.3f\n", mx, my, c1, c2);
  fprintf("Resíduo em relação a média: %.3f\nResíduo em relação ao ajuste linear: %.3f\n", st, sr);
  fprintf("Desvio padrão em relação a média: %.3f\nDesvio padrão em relação ao ajuste linear: %.3f\n", syd, sy_sobreX);
  fprintf("Coeficiente de determinação: %.3f", r2);

  % Definição da função de ajuste linear
  f = @(x) c1*x + c2;

  vx = linspace(min(x), max(x), 200);
  vy_ajuste = f(vx);

  figure;

  plot(x, y, 'ro', 'MarkerSize', 7); % 'ro' = red circles

  % 2. Manter o gráfico atual para adicionar a linha de ajuste
  hold on;

  % 3. Plotar a linha de ajuste linear f(x)
  plot(vx, vy_ajuste, 'b-', 'LineWidth', 2); % 'b-' = blue solid line

  % Configurações do gráfico
  xlabel('x');
  ylabel('y');
  title('Ajuste Linear e Dados Originais');

  legend('Dados Originais', 'Ajuste Linear: f(x) = c1x + c2');

  grid on;
  hold off;

endfunction
