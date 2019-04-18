function [A_k S] = task4(image, k)
  A = imread(image);
  a = double(A(:, :));
  m = size(A, 1);
  n = size(A, 2);
  
  # 1
  nyu = zeros(m, 1);
  for i = 1:m
    nyu(i) = sum(double(a)(i, :)) / size(A, 2);
  endfor
  # 2
  for i = 1:m
    for j = 1:n
      a(i, j) = a(i, j) - nyu(i);
     endfor
  endfor
  #
  Z = (a * a') / n - 1;
  #
  [V S] = eig(Z);
  #
  W = V(:, 1:k);
  #W = W';
  # 6
  Y = W' * a; # projection of A in PCS
  # 7
  A_k = W * Y + nyu;
  imshow(A_k);
  # disp(S);
endfunction