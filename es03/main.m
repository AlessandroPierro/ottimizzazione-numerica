A = [1 1; 1 2];
b = [0 0]';

x = [1.5 1.5]';

[x] = SD_quad(x, A, b, 10^-4, 20);