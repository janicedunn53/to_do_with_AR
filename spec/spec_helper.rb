ENV["RACK_ENV"] = 'test'

require('rspec')
require('capybara/rspec')
require('pg')
require('pry')
require('./lib/list')
require('./lib/task')
