require "http"

system "clear"

puts "Which item would you like to see? Please choose a number between 1 or 2 or choose all."
number = gets.chomp

case number
when "1" 
  response = HTTP.get("http://localhost:3000/api/first_product")
  first_product = response.parse
end

return first_product

