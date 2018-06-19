local test3 = 20

function some_function(test3)
  if true then
    local test3 = 40
    print(test3)
    --Output 40
  end
  print(test3)
  --Output 30 (because this function is called with 30 below)
end
some_function(30)
  
print(test3)
--Output 20