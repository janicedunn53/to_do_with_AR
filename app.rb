require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
require("./lib/list")
require("./lib/task")
require("pg")
also_reload("/lib/**/*.rb")

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/tasks") do
  description = params.fetch("description")
  task = Task.new({:description => description})
  task.save()
  @tasks = Task.all()
  erb(:index)
end

get("/tasks/:id/edit") do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end
