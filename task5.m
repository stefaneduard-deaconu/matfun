function task5()
  image_path = "./in/images/image3.gif";
  image = imread(image_path);
  
  m = size(image, 1);
  n = size(image, 2);
  minimum = min(m, n);
  
  diag = [];
  err = [];
  inf = [];
  
  [Ak S] = task4(image_path, minimum);
  A = image;
  for k = 1:minimum
    # (1) for diag(S):
    s = 0;
    for i = 1:k
      s = s + S(i, i);
    endfor
    diag = [diag s];
    # (2) for information about Z:
    inf(k) = sum(S(1:k)) / sum(S(1: minimum, 1:minimum));
    # (3) for error approximation:
    vect = Ak(:)' - A(:)';
    err(k) = vect * vect' / (m * n);
  endfor
  # subplot 1
  # sum of diag(S):
  subplot(2, 2, 1);
  
  f_diag = @(k) (diag(k));
  [x y] = fplot(f_diag, [1, 200]);
  plot(x, y);
  
  # subplot 2
  # information :
  subplot(2, 2, 1);
  
  f_information = @(k) (inf(k));
  [x y] = fplot(f_information, [1, 200]);
  plot(x, y);
  
  # subplot 3
  # error of approximation:
  
  subplot(2, 2, 1);
  
  f_error = @(k) (err(k));
  [x y] = fplot(f_error, [1, 200]);
  plot(x, y);
  
  # subplot 4
  # Data compression ratio:
  subplot(2, 2, 4);
  
  f_compress = @(k)  ((2 * k + 1) / n);
  [x, y] = fplot(f_compress, [1, 200]);
  plot(x, y);
  
  xlabel ("Index");
  ylabel ("Singular value");
  title ("Figura 4 - Graficele rezultate pentru cerintat 2 - image2");
end