function [Link] = get_link_matrix(Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  % TODO: get_link_matrix implementation
	[m, n] = size(Labyrinth);
  N = m * n;
  Link = zeros(N + 2, N + 2);
  Link(N + 1, N + 1) = 1;
  Link(N + 2, N + 2) = 1; % acelasi lucru ca la matricea de adiacenta
  for i= 1:m
    for j= 1:n
      elem = Labyrinth(i,j);
      idx_elem = (i-1)*n + j;
      numar_posibilitati = 0; % retin numarul de posibilitati
      if !bitand(elem, 1)
      numar_posibilitati ++;
      endif
      if !bitand(elem, 2)
      numar_posibilitati ++;
      endif
      if !bitand(elem, 4)
      numar_posibilitati ++;
      endif
      if !bitand(elem, 8)
      numar_posibilitati ++;
      endif
      afisare = 1/numar_posibilitati; % probabilitatea de a merge in alt 'nod'
      % cazul stanga
      if !bitand(elem, 1)
          if j == 1
            Link(idx_elem, N + 2) = afisare;
        else
          Link(idx_elem, (i-1)*n + j - 1) = afisare;
          endif
      endif
      % cazul dreapta
      if !bitand(elem, 2)
          if j == n
            Link(idx_elem, N + 2) = afisare;
        else
          Link(idx_elem, (i-1)*n + j + 1) = afisare;
          endif
      endif
      % cazul jos
      if !bitand(elem, 4)
          if i == m
            Link(idx_elem, N + 1) = afisare;
        else
          Link(idx_elem, (i)*n + j) = afisare;
          endif
      endif
      % cazul sus
      if !bitand(elem, 8)
          if i == 1
            Link(idx_elem, N + 1) = afisare;
        else
          Link(idx_elem, (i-2)*n + j) = afisare;
          endif
      endif
      
    endfor
  endfor
  S = sparse(Link); % matricea va fi de tip sparse
  Link = S;

endfunction
