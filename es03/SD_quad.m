function [x] = SD_quad(x, A, b, tau, Nmax)
    
    f = (1/2) * x' * A * x - b' * x;
    gradf = A * x - b;
    
    for i = 1:Nmax
       
        if norm(gradf) < tau
            return
        end
        
        alpha = norm(gradf)^2 / (gradf'*A*gradf);
        
        x = x - alpha * gradf;
        f = f - (1/2) * alpha * norm(gradf)^2;
        gradf = gradf - alpha * A * gradf;
        
        fprintf("iter %i -----\n", i);
        fprintf("> f(x) = %f\n", f);
        fprintf("> gradf(x) = (%f, %f)\n", gradf);
        fprintf("> alpha = %f\n", alpha);
        
    end 
    
end

