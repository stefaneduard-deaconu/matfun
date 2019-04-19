function [m A eigenfaces pr_img] = eigenface_core (database_path)
  
  # 1
  T = [];
  for i = 1:10
    this_path = char([database_path int2str(i) ".jpg"]);
    this_image = double(rgb2gray(imread(this_path)));
    column = this_image(:);
    #imshow(uint8(this_image));
    #disp([size(column, 1) size(column, 2)]);
    T = [T column];
    #disp([size(T, 1) size(T, 2)]);
  endfor
  # suplimentar pasului 1:
  # am adaugat asta aici pt a avea inca de acum multimea de imagini
  M = reshape(T, 10, 200, 200);
  #disp(T(1:10, 1:10));
  # 2
  m = mean(T);
  # 3
  A = T - m;
  # 4
  [lambda V] = eig(A' * A);
  #disp(lambda);
  #disp(V);
  EigFaces = A * V;
  eigenfaces = EigFaces;
  # 5. Se calculeaza proiectia fiecare imagini din multimea de imagini M
  #     in spatiul fetelor astfel: PrImg = EigFaces' * A
  # (*I will replace with making a tensor with the images, in the beginning;
  PrImg = EigFaces' * T;
  pr_img = PrImg;
endfunction
