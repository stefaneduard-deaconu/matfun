function task2()
  image_path = "./in/images/image2.gif";
  image = double(imread(image_path));
  #
  # subplot 1
  subplot(2, 2, 1);
  y = svd(image); # the singular values
  x = 1:size(image, 1);
  plot(x, y);
  
  # subplot 2
  # information about the first k singular values
  S = svd(image);
  subplot(2, 2, 2);
  info = zeros(size(S, 1));
  for k = 1:size(S, 1)
    info(k) = sum(S(1:k)) / sum(S);
  endfor
  f_singular_info = @(k) info(int32(k));
  [x y] = fplot(f_singular_info, [1 size(S, 1)]);
  plot(x, y);
  
  # subplot 3
  # information about the first k singular values
  subplot(2, 2, 3);
  A = image; # for having a clean, renamed copy of the image's matrix
  how_many = min(size(A, 1), size(A, 2));
  error_approx = zeros(how_many);
  for k = 1:how_many
    A_k = double(task1(image_path, k));
    m = size(A_k, 1);
    n = size(A_k, 2);
    elem = (A_k(:))' - (A(:))';
    error_approx(k) = elem * elem' / (m * n);
  endfor
  f = @(k) error_approx(int32(k));
  [x y] = fplot(f, [1, 200]);
  plot(x, y);
  
  # subplot 4
  # Data compression ratio:
  subplot(2, 2, 4);
  A = image;
  m = size(image, 1);
  n = size(image, 2);
  numerator_factor = m + n + 1;
  denominator = m * n;
  
  f_compress = @(k)  (numerator_factor * k / denominator);
  [x, y] = fplot(f_compress, [1, 200]);
  plot(x, y);
  
  xlabel ("Index");
  ylabel ("Singular value");
  title ("Figura 4 - Graficele rezultate pentru cerintat 2 - image2");
end