f = @(x, y) 3*(1-x).^2.*exp(-x.^2-(y+1).^2)-10*(x/5-x.^3-y.^5) ...
    .*exp(-x.^2-y.^2)-exp(-(x+1).^2-y.^2)/3;

gradf = @(x, y) [-6*(1-x+x.*(1-x.^2)).*exp(-x.^2-(y+1).^2)+ ...
    -10*(1/5-3*x.^2-2*x.*(x/5-x.^3-y.^5)).*exp(-x.^2-y.^2)+ ...
    +2*(x+1).*exp(-(x+1).^2-y.^2)/3 ...
    -6*(1-x).^2.*(y+1).*exp(-x.^2-(y+1).^2)+ ...
    +10*(y.^4+2*y.*(x/5-x.^3-y.^5)).*exp(-x.^2-y.^2)+ ...
    +2*y.*exp(-(x+1).^2-y.^2)/3];


x = linspace(-3, 3, 100);
y = linspace(-3, 3, 100);

[X, Y] = meshgrid(x, y);

Z = f(X, Y);

% Computing the antigradient in a point
point = [-0.5051, -0.9495];
grad = gradf(point(1), point(2));
norm_agrad = -grad/norm(grad);
alpha = linspace(0, 1, 100);
x_grad = point(1) + alpha * norm_agrad(1);
y_grad = point(2) + alpha * norm_agrad(2);

% Plotting
figure;
subplot(1,2,1);
mesh(X, Y, Z);
title("f function");
subplot(1,2,2);
contour(X, Y, Z);
title("f function - contour plot");
hold on;
plot(point(1), point(2), "*");
plot(x_grad, y_grad, "LineWidth", 1.5);
hold off;


