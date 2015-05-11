require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/employee")
require("./lib/division")
also_reload("lib/**/*.rb")
require("pg")

get("/") do
  @divisions = Division.all()
  erb(:index)
end

get("/divisions/:id/edit") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

post("/divisions") do
  division = params.fetch("division")
  new_division = Division.new(:division => division, :id => nil)
  new_division.save()
  erb(:division_success)
end

patch("/divisions/:id") do
  division = params.fetch("division")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:division => division})
  erb(:division_success)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:division)
end

post("/employees") do
  @divisions = Division.all()
  name = params.fetch("name")
  division_id = params.fetch("division_id").to_i()
  @division = Division.find(division_id)
  @employee = Employee.new({:name => name, :division_id => division_id})
  @employee.save()
  erb(:index)
end

patch("/employees/:id") do
  @divisions = Division.all()
   name = params.fetch("name")
   @employees = Employee.find(params.fetch("id").to_i())
   @employees.update({:name => name})
  erb(:index)
end

get("/employees/:id/edit") do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end
