
function val = noGP(f,x0,sigma0,NUM_OF_ITERATIONS, OPTIMAL, TARGET_DISTANCE)
% initialization
% f:                  objective function value
% x0:                 initial point
% sigma0:             initial muttaion strength
% NUM_OF_ITERATIONS:  number of maximum iterations
% OPTIMAL:            global optima
% TARGET_DISTANCE:    target distance to global optima



% example input:      fun = @(x) x' * x
%                     noGP(fun, randn(10,1)*100,5,500,zeros(10,1),exp(-7)) 

[n,m] = size(x0);

x = zeros(n, 1000);                        % parent solution with dim n 
y = zeros(n,1);                            % offspring solution with dim n
sigma = zeros(1,1000);                     % mutation strength
f_x = zeros(1,1000);                       % objectie function value for selected offspring

D = 1;
c2 = -0.2;                                 % decrease step size
c3 = 0.6;                                  % increase step size

t = 1;                                     % # of iterations

sigma(1) = sigma0;                         
x(:,1) = x0;                               

while((t < NUM_OF_ITERATIONS) && (norm(x(:,t)-OPTIMAL(:,1)) > TARGET_DISTANCE))

    % offspring_generation
    y = x(:,t) + sigma(t)*randn(n,1);
    
    % objective function val 
    fy = f(y);
    fx = f(x(:,t));
    
    if(fy < fx)                             % good offspring
       x(:,t+1) = y;
       sigma(t+1) = sigma(t) * exp(c3/D);   % increase step size
       f_x(t) = fy; 
    else                                    % bad offspring
       x(:,t+1) = x(:,t);  
       sigma(t+1) = sigma(t) * exp(c2/D);   % reduce step size
       f_x(t) = fx; 
    end
    t = t + 1;
    
    
end 
    
val = cell(t,sigma,f_x);

% final evaluated value 
disp('Last iteration output');
d0 = sprintf('Number of function evaluations: %d', t);
d1 = sprintf('point: ');
d2 = sprintf("objective function value: %f", f(x(:,t)));
d3 = sprintf("mutation strength: %f", sigma(t));
disp(d0);
disp(d1);
disp(x(:,t));
disp(d2);
disp(d3);

% plot
figure(1);
plot(1:NUM_OF_ITERATIONS, sigma(1:NUM_OF_ITERATIONS));
xlabel('number of function evaluations');
ylabel('sigma(mutation strength)');

figure(2);
semilogy(1:NUM_OF_ITERATIONS, f_x(1:NUM_OF_ITERATIONS));
xlabel('number of function evaluations');
ylabel('log(f(x))');

end
