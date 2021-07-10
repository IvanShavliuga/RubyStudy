def factorial(n)
    (1..n).inject(:*) || 1
end

puts factorial(42)
