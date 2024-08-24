function [Adj] = get_adjacency_matrix(Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % TODO: get_adjacency_matrix implementation
	[m, n] = size(Labyrinth);
  N = m * n; % marimea pentru matricea de adiacenta fara WIN si LOSE
  Adj = zeros(N + 2, N + 2);
  Adj(N + 1, N + 1) = 1;
  Adj(N + 2, N + 2) = 1; % liniile pentru WIN si LOSE sunt gata
  for i= 1:m
    for j= 1:n
      elem = Labyrinth(i,j); % elementul pentru care realizez posibilitatile de deplasare
      idx_elem = (i-1)*n + j;
      % cazul stanga
      if !bitand(elem, 1)
          if j == 1
            Adj(idx_elem, N + 2) = 1; 
        else
          Adj(idx_elem, (i-1)*n + j - 1) = 1;
          Adj((i-1)*n + j - 1, idx_elem) = 1;
          endif
      endif
      % cazul dreapta
      if !bitand(elem, 2)
          if j == n
            Adj(idx_elem, N + 2) = 1;
        else
          Adj(idx_elem, (i-1)*n + j + 1) = 1;
          Adj((i-1)*n + j + 1, idx_elem) = 1;
          endif
      endif
      % cazul jos
      if !bitand(elem, 4)
          if i == m
            Adj(idx_elem, N + 1) = 1;
        else
          Adj(idx_elem, (i)*n + j) = 1;
          Adj((i)*n + j, idx_elem) = 1;
          endif
      endif
      % cazul sus
      if !bitand(elem, 8)
          if i == 1
            Adj(idx_elem, N + 1) = 1;
        else
          Adj(idx_elem, (i-2)*n + j) = 1;
          Adj((i-2)*n + j, idx_elem) = 1;
          endif
      endif
      
    endfor
  endfor
  S = sparse(Adj); %matricea va fi de tip sparse
  Adj = S;

endfunction
