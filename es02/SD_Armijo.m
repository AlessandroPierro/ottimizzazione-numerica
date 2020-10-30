function [x, k] = SD_Armijo(x, f, gradf, tau, s, sigma, beta, Nmax)
    for k = 1:Nmax
        f_x = f(x);
        grad = gradf(x);
        if norm(grad) < tau
            return
        end
        d = - grad / norm(grad);
        alpha = s;
        x_hat = x + alpha * d;
        f_hat = f(x_hat);
        p = grad * d;
        while f_hat > f_x + sigma * alpha * p
            alpha = alpha * beta;
            x_hat = x + alpha * d;
            f_hat = f(x_hat);
        end
        x = x_hat;
    end
end

