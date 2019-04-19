function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  # 6
  test_image = double(rgb2gray(imread(image_path)));
  T = test_image(:); # column matrix
  test_image = test_image - mean(T);
  # 7
  PrTestImg = eigenfaces' * T;
  #disp(size(PrTestImg));
  # 8
  # now we test similarity
  #disp(size(pr_img));
  #disp(pr_img(2, :));
  min = sum((PrTestImg - pr_img(1))' * (PrTestImg - pr_img(1)));
  index = 1;
  disp(min);
  for i = 2:10
    posible_min = sum((PrTestImg - pr_img(i))' * (PrTestImg - pr_img(i)));
    if posible_min < min
      min = posible_min;
      index = i;
    endif
    disp([index min]);
  endfor
  min_dist = min;
  output_img_index = index;
  # 6. Data fiind o imagine de test, aceasta se transforma intr-un vector coloana
  # si se scade(nu extrage) din ea media similar pasilor 1 si 3.
  # 7. Se calculeaza proiectia imaginii de test in spatiul fetelor astfel: P rT estImg =
  # EigF acesT ? vectorul coloana rezultat la pasul 6.
  # 8. Se determina cea mai mica distanta intre proiectia imaginii de test obtinuta la pasul 7 si proiectiile obtinute la pasul 5. Intuitiv, la acest pas,
  # imaginea din multimea M cea mai asemanatoare cu imaginea de test se
  # determina.
endfunction
