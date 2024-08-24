function [decoded_path] = decode_path(path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation
  [m, n] = size(path); % liniile si coloanele
  decode_path = zeros(m - 1,2); % matrice de linii si 2 coloane
  for i= 1: m-1
    % adaug indicele coloanei
    if floor(path(i)/cols) == path(i)/cols;
    decoded_path(i , 2) = cols;
      else 
     decoded_path(i , 2) = rem(path(i),cols);
    endif
    % adaug indicele liniei
    if floor(path(i)/cols) == path(i)/cols;
    decoded_path(i , 1) =  floor(path(i)/cols);
      else 
     decoded_path(i , 1) =  floor(path(i)/cols) + 1;
    endif
  endfor

endfunction