function A_k = task1(image, k)
  image_mat = imread(image);
  [U S V] = svd(image_mat);
  
  U2 = U(1:size(U, 1), 1:k);
  S2 = S(1:k, 1:k);
  V2 = V(1:size(V, 2), 1:k);
  
  A_k = uint8(U2 * (S2 * V2'));
end