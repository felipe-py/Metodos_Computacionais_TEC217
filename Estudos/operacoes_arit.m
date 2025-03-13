% COLOCANDO ; NO FINAL, ELE NÃO EXIBE NA LINHA DE COMANDO

format short  % menos casas decimais

a = sqrt(16);  % raiz quadrada de 16
b = nthroot(16, 4);  % raiz quarta de 16
c = sin(30); % resposta em radianos
d = sind(30); % resposta em com base no grau
e = sin(pi/6); % cálculo usando radianos
f = acos(-0.5); % arcos radianos

disp(a);
disp(b);
disp(c);
disp(d);
disp(e);
disp(f);

format rat   % mais casas decimais

g = 12/18;
disp(g);

format default  % padrão

% exemplos de arredondamento, para cima e para baixo

h = round(2.52);

i = round(2.49);

disp(h);
disp(i);

% comando floor obriga o arredondamento para baixo e ceil para cima
% comando fix retira casas decimais

n1=234; n2=378;
disp(n1);disp(n2);

% possibilidade de guardar strings, como no C

nome = 'Teste nome';
disp(nome)

% encontrando raízes de uma equação de segundo grau

a=1;b=-1;c=-6;

d = b^2-4*a*c;
x1 = (-b + sqrt(d))/(2*a);
x2 = (-b - sqrt(d))/(2*a);
disp(x1);disp(x2);





