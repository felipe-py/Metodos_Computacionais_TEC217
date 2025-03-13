% Script teste para visualizar função seno em um intervalo

x = -10:0.1:10;  % x vai de -10 a 10, de 0.1 em 0.1
y = sin(x);      % aplica-se a função sen e cos a x
y2 = cos(x);


plot(x, y, '-b', x, y2, '-g'); % plot das curvas com definição das cores
title('Função seno e cosseno');        % definindo título do gráfico
xlabel('Eixo X');         % label para os eixos x e y
ylabel('Eixo Y');
legend('Seno', 'Cosseno');  % legenda para as curvas
grid on;
