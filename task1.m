function A_k = task1(image, k)
  # image is the image path
  #mat = double(imread(image));
  #[U svd_mat V] = svd(mat, k);
  # disp(mat);
  # disp(svd_mat);
  # disp(U);
  
  #m = size(U, 1); # the num of columns in S
  #n = size(V, 2); # the num of rows in S 
  #S = zeros(m, n);
  
  #for i = [1 : k]
  #  S(i, i) = svd_mat(i);
  #endfor
  #disp([size(U, 1) size(U, 2)]);
  #disp([m n]);
  #disp([size(V, 1) size(V, 2)]);
  #disp(S(1,1));
  
  mat = double(imread(image));
  [U S V] = svd(mat, k);
  
  A_k = U * S * V';
  
  disp([size(U, 1) size(U, 2)]);
  disp([size(S, 1) size(S, 2)]);
  disp([size(V, 1) size(V, 2)]);
  # disp(S(1:5, 1:5));
  min_dim = min(size(S, 1), size(S, 2));
  U2 = U(1:size(U, 1), 1:k);
  S2 = S(1:k, 1:k);
  V2 = V(1:size(V, 2), 1:k);
  disp([size(U2, 1) size(U2, 2)]);
  disp([size(S2, 1) size(S2, 2)]);
  disp([size(V2, 1) size(V2, 2)]);
  
  A_k = U2 * S2 * V2';
  
  disp([A_k(1, 91:94) mat(1, 91:94)]);
  
  
  imwrite(mat, "sol.gif");
end