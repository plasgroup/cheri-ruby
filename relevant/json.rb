require 'json'

state = JSON.state.new
state.space = "\0" * 1024

puts JSON.generate({a: :b}, state)
