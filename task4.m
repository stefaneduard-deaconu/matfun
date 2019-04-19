function [A_k S] = task4(image_path, k)
  image = imread(image_path);
  A = double(image);
  m = size(A, 1);
  n = size(A, 2);
  # 1
  nyu = zeros(m);
  for i = 1:m
    nyu(i) = sum(A(i, :)) / size(A, 2);
  endfor
  # 2
  for i = 1:m
    for j = 1:n
      A(i, j) = A(i, j) - nyu(i);
     endfor
  endfor
  ## (3)
  Z = (A * A') / (n - 1);
  ## (4)
  [V S] = eig(Z);
  ## (5)
  W = V(:, 1:k);
  #W = W';
  # 6
  Y = W' * A; # projection of A in PCS
  # 7
  A_k = W * Y;
  for i = 1:m
    for j = 1:n
      A_k(i, j) = A_k(i, j) - nyu(i);
     endfor
  endfor
  # imshow(uint8(A_k));
  # disp(S);
  # disp(S);
endfunction