require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "
  <h1>Dice Roll</h1>
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  </ul>
  "
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = []
	
  @outcome = sum.push(first_die, second_die)
	
  erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
	second_die = rand(1..10)
  sum = []
	
	@outcome = sum.push(first_die, second_die)
	
	erb(:two_ten)
end

get("/dice/1/20") do
  die = rand(1..20)
  sum = []
	
	@outcome = sum.push(die)
	
	erb(:one_twenty)
end

get("/dice/5/4") do
  first_die = rand(1..4)
	second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  sum = []
	
	@outcome = sum.push(first_die, second_die, third_die, fourth_die)
	
	erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
