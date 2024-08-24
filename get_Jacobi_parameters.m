function [G, c] = get_Jacobi_parameters(Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  % TODO: get_Jacobi_parameters
	n = size(Link, 1); % numarul de elemente/noduri
  G = Link([1 : n-2], [1: n-2]); % matricea de iteratie pentru elemente fara WIN sau LOSE
  c = Link([1: n-2], n-1); % vectorul de iteratie
  %matrici de tip sparse
  G = sparse(G);
  c = sparse(c);

endfunction
