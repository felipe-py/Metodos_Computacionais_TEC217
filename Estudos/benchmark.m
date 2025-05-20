t = 0;

for i = 1:100
  tic;
  run('LU.m');  % ou simplesmente: script(); se for uma função
  t += toc;
end

printf("Tempo médio: %.6f segundos\n", t / 100);

