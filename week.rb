# Language: Ruby
# Task Description: The code checks for Fridays in the year 2017 that are the 13th of the month. By using loops and proper logic, find the same data for the years between 1990 and 2020.

def week_day(year, month, day)
  [Time.new(year, month, day).monday?, Time.new(year, month, day).tuesday?, Time.new(year, month, day).wednesday?, Time.new(year, month, day).thursday?, Time.new(year, month, day).friday?, Time.new(year, month, day).saturday?, Time.new(year, month, day).sunday?]
end

year = Integer(gets)
month = Integer(gets)
day = Integer(gets)
puts Time.new
puts week_day(year, month + 1, day)
