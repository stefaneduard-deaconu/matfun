function [A_k S] = task3(image, k)
  A = imread(image);
  a = double(A);
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
  # 3
  Z = double(a).' / sqrt(n - 1);
  # 4
  [U S V] = svd(Z);
  # test = U * S * V' - Z;
  # disp(sum(sum(test(1:200, 1:200)))); #seems alright, very small values, so equivalent to 0 so the matrices are equal
  # 5
  W = V(:, 1:k);
  # 6
  Y = W.' * (double(a)); # projection of A in PCS
  # 7
  A_k = W * Y;
  # disp(nyu);
  A_k = A_k + nyu;

  imshow(uint8(A_k));
endfunction