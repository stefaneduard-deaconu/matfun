function task5()
  subplot (2, 2, 1)
  fplot (@sin, [-10, 10]);
  subplot (2, 2, 2)
  fplot (@cos, [-10, 10]);
  
  subplot (2, 2, 3)
  fplot (@sin, [-10, 10]);
  subplot (2, 2, 4)
  fplot (@cos, [-10, 10]);
end