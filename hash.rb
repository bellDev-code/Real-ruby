params = {} 

params[:user] = { name: "Michael Hartl", email: "sumaoo20@naver.com"}

# puts params
# puts params[:user][:email]

flash = { success: "It worked!", danger: "It failed." }

flash.each do |key, value|
    puts "Key #{key.inspect} has value #{value.inspect}"
end