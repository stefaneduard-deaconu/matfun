function [A_k S] = task3(image_path, k)
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
  A_k = W * Y + nyu;
  
  imshow(uint8(A_k));
endfunction