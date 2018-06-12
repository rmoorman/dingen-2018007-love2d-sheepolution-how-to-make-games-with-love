example = function()
  print("Hello World!")
end

function example2()
  print("Hello World!")
end

example()
example2()



function example3(num)
  print("I like the number " .. num)
end

example3(15)
example3(2)
example3(44)
example3(100)



function giveMeFive()
  return 5
end

a = giveMeFive()
print(a)



function sum(a, b)
  return a + b
end

print(sum(200, 95))
