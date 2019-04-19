function task6()
  path = "./task6/dataset/";
  [m A e p] = eigenface_core(path);
  image_path = "./task6/dataset/1.jpg";
  face_recognition(image_path, m, A, e, p);
end