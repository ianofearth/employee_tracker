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
