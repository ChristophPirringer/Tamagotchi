require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/tamagotchi")

get("/") do
  @@backgrounds = Tamagotchi.backgrounds()
  Tamagotchi.clear()
  @dave = Tamagotchi.new('dave')
  @dave.save()
  @dave.message()
  erb(:index)
end

get("/feed") do
  @dave = Tamagotchi.dave()
  @dave.feed()
  erb(:index)
end

get("/nap") do
  @dave = Tamagotchi.dave()
  @dave.nap()
  erb(:index)
end

get("/play") do
  @dave = Tamagotchi.dave()
  @dave.play()
  erb(:index)
end

get("/next_day") do
  @dave = Tamagotchi.dave()
  @dave.day_passes()
  erb(:index)
end
