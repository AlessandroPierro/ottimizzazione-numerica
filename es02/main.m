f = @(x) x.^2;
gradf = @(x) 2*x;

[x, it] = SD_Armijo(-3, f, gradf, 10^-2, 1, 10^-4, 0.4, 20);

xs = linspace(-5, 5, 1000);
plot(xs, f(xs));
hold on
plot(x, f(x), "-*");