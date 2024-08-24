function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls
  
  % TODO: parse_labyrinth implementation
	fid = fopen(file_path, "r"); %fisierul din care se realizeaza citirea
  dimensiuni = fscanf(fid,'%d %d', [1, 2]);
  m = dimensiuni(1);
  n = dimensiuni(2);
  Labyrinth = zeros(m, n); %creez labirintul cu linii m si coloane n
  for i = 1:m
    linie = fscanf(fid,'%d', [1, n]); % citesc si adaug linie cu linie
    Labyrinth(i, :) = linie;
  endfor 
  fclose(fid);

endfunction
