clc;

x = [10, 20, 30, 40, 50, 60, 70, 80];
y = [25, 70, 380, 550, 610, 1220, 830, 1450];

X = log(x);
Y = log(y);

fprintf("Vetores após linearização com log\nVetor x:\n");
disp(X);
fprintf("Vetor y:\n");
disp(Y);
fprintf("\n\n");


RegressaoLinear(X, Y);
