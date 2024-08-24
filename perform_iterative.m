function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

   % TODO: perform_iterative implementation
  x = x0;% sol initiala
  err = tol + 1; %eroare initiala mai mare ca toleranta
  steps = 0;
  while err > tol && steps < max_steps
    x_prev = x; %solutia anterioara
    x = G * x + c;
    err = norm(x - x_prev); %calculul erorii
    %din verificari mi-am dat seama ca daca mai impart la norm(x_prev) ii va lua mai putini pasi de executat
    steps = steps + 1;
  endwhile
  
endfunction
