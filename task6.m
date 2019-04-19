function task6()
  path = "./task6/dataset/";
  [m A e p] = eigenface_core(path);
  image_path = "./task6/dataset/1.jpg";
  [dist index] = face_recognition(image_path, m, A, e, p);
  
  original = double(rgb2gray(imread(image_path)));
  
  start = (index - 1) * 40000;
  stop = start + 40000 - 1;
  image = reshape(A(start:stop), 200, 200);
  
  imshow(uint8(original));
  #imshow(uint8(image));
  
end