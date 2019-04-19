function [A_k S] = task3(image_path, k)
  image = imread(image_path);
  A = double(image);
  m = size(A, 1);
  n = size(A, 2);
  # 1
  nyu = [];
  for i = 1:m
    nyu = [nyu (sum(A(i, 1:n)) / n)];
  endfor
  disp([m n]);
  disp(size(nyu));
  # 2
  for i = 1:m
    for j = 1:n
      A(i, j) = A(i, j) - nyu(i);
     endfor
  endfor
  #disp(nyu);
  #disp(A(1:15));
  #disp(image(1:15));
  # 3
  Z = A' / sqrt(n - 1);
  # 4
  [U S V] = svd(Z);
  ## test = U * S * V' - Z;
  ## disp(sum(sum(test(1:200, 1:200)))); #seems alright, very small values, so equivalent to 0 so the matrices are equal
  # 5
  W = V(:, 1:k);
  # 6
  Y = W' * A; # projection of A in PCS
  # 7
  A_k = W * Y;
  for i = 1:m
    for j = 1:n
      A_k(i, j) = A_k(i, j) + nyu(i);
     endfor
  endfor
  imshow(uint8(A_k));
endfunction