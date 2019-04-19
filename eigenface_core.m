function [m A eigenfaces pr_img] = eigenface_core (database_path)
  
  # 1
  T = [];
  for i = 1:10
    this_path = char([database_path int2str(i) ".jpg"]);
    this_image = double(rgb2gray(imread(this_path)));
    column = this_image(:);
    imshow(uint8(this_image));
    disp([size(column, 1) size(column, 2)]);
    T = [T column];
    disp([size(T, 1) size(T, 2)]);
  endfor
  disp(T(1:10, 1:10));
  # 2
  m = mean(T);
  disp(m);
  # 3
  A = T - m;
  # 4
  [lambda V] = 
  EigFaces = A * V;
  # end before full implementation, as to be able to test the task:
  eigenfaces = 0;
  pr_img = 0;
  
endfunction
