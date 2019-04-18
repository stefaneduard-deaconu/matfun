function task5()
  path = "./task6/dataset/";
  # 1
  T = [];
  for i = 1:10
    this_path = char([path int2str(i) ".jpg"]);
    this_image = double(rgb2gray(imread(this_path)));
    column = this_image(:);
    #disp(size(column, 1));
    #disp(size(column, 2));
    #disp(column'(1, 1:5));
    T = [T column];
    #disp(T(1:5, size(T, 2))');
  endfor
  disp(T(1:10, 1:10));
  # 2
  m = mean(T);
  disp(m);
  # 3
  A = T - m;
  
end