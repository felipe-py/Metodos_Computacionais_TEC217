% USANDO VETORES


% vetor linha

v = [1 2 3];
disp(v)

v2 = [4,5,6];
disp(v2)

% vetor coluna

vc = [7;8;9];
disp(vc)

% transpor vetor de linah para coluna

vt = [10,11,12]';
disp(vt)

% acessando elementos do vetor

v(1)  % pelo índice
v(end) % final
length(v) % tamanho

vg = [4 8 2 96 7 58 41 25 23 22 20 14 15 12 ];
length(vg)
viu = vg(2:5)

u=vg(2:2:end)
u=vg([1 2 3 4])


a = [1 2 3];
b = [7 8 9];
c = [a b];
disp(c)


% inserir número em vetor

d = [1,2,3];
d = [-1 a];
disp(d)

e = [d(1:2) -5 d(3:4)];
disp(e);

% eliminar elementos do vetor

f = [34,56,78,91];
f(2:3) = [];
disp(f)

% manipulando escalares com vetores
f + 5
f * 2

% operações entre vetores

p1 = [5, 9, 7, 8, 12];
p2 = [45, 23, 76];
p2 = [zeros(1,length(p1)-length(p2)), p2]
p1+p2

% calculando produto escalar de vetores

u = [5 6 7];
v = [4 3 2];
w = dot(u,v)
u*v'

% calculando módulo do vetor

norm(u)
sqrt(u*u')

% calculando ângulo entre vetores

ang = acosd((dot(u,v))/(norm(u) * norm(v)))

% calculando produto vetorial

cross(u,v)

% criando um vetor pré-definido

x = linspace(0,10,5)
z = 0:5/2:20
w = pi/6:0.1:pi;
sin(w)

% calculando log base 10

l = 1:0.1:1.5;
logs = [l log10(l)]

% multiplicando elemento a elemento do vetor

u.*v

% funções diversas aplicadas a vetores

vet = [3 1 4 2 5];

mean(vet)
max(vet)
min(vet)
sort(vet)
std(vet)

