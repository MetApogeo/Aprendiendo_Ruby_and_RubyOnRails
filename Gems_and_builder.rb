# gem install pry
require 'bundler/setup'
require 'pry'
require 'faker'

#puts "Hola voy a usar pry"
#binding.pry #permite dar pausas al ejecutar el codigo, eso ayuda a ver que esta pasando en el codigo
#puts "adios"

# bundler -> Gemfile

puts Faker::Name.name
binding.pry
