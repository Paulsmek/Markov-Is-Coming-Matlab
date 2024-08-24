function [path] = heuristic_greedy(start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  % TODO: heuristic_greedy implementation
	[m,n] = size(Adj); % liniile si coloanele
  visited = zeros(n,1); % nodurile vizitate
  visited(start_position) = 1;
  path = start_position; % calea solutiei
  while Adj(path(end), n - 1) == 0 % pana cand starea curenta are cale directa catre WIN
    indice_maxim = 0;
    valoare_maxima = 0;
    % calculez probabilitatea maxima de a ajunge intr-un nod
    for i= 1: n-2
      if ((Adj(path(end), i) == 1)  && (visited(i) == 0))
        if(probabilities(i) > valoare_maxima)
        valoare_maxima = probabilities(i);
        indice_maxim = i;
        endif
      endif
    endfor
    if indice_maxim == 0 % nu am gasit vecini, deci sterg ultimul nod din path 
      path(end) = [];
    else 
      path(end + 1) = indice_maxim; % 'merg' pe calea respectiva
      visited(indice_maxim) = 1;
    endif
  endwhile
  path(end + 1) = n - 1;%adaug winul in path
  path = path'; 
  

endfunction
