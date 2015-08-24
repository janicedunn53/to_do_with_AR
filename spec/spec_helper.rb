ENV["RACK_ENV"] = 'test'

require("sinatra/activerecord")
require('rspec')
require('capybara/rspec')
require('pg')
require('pry')
require('list')
require('task')


RSpec.configure do |config|
  config.after(:each) do
    Task.all().each() do |task|
      task.destroy()
    end
    List.all().each() do |list|
      list.destroy()
    end
  end
end
