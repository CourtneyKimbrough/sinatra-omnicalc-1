require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @original_num = params.fetch("user_num").to_f
  @squared_num = (@original_num ** 2)
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @original_num = params.fetch("user_num").to_f
  @square_num = Math.sqrt(@original_num)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @years = params.fetch("years").to_i
  @apr = params.fetch("apr").to_f
  @principal = params.fetch("principal").to_i
  @payment = 0
  @rate = (@apr/100)/12
  @periods = @years*12
  @num = @rate * ((1 + @rate) ** @periods)
  @den = ((1 + @rate) ** @periods) - 1
  @payment = @principal * (@num/@den)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @ran = rand(@min..@max)
  erb(:random_results)
end
