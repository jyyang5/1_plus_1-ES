
NUM_OF_RUNS = 10;
sigma_matrix = zeros(2000,NUM_OF_RUNS);           % store all sigma
f_x_matrix = zeros(2000,NUM_OF_RUNS);             % store all fx
T_array = zeros(1,NUM_OF_RUNS);                   % # of iterations for the stop creteria

for i = 1:NUM_OF_RUNS
    
    
end

    
    % graph
    
    figure(1);
    semilogy(1:T, sigma_funEva_array(1:T));
    xlabel('number of function evaluations');
    ylabel('log(sigma)');

    %figure(2);
    %semilogy(1:t, sigma_iterate_array(1:t));
    %xlabel('number of iterations');
    %ylabel('log(sigma)');


    figure(3);
    semilogy(1:T-1, f_x(1:T-1));
    xlabel('number of function evaluations');
    ylabel('log( f(x) )');