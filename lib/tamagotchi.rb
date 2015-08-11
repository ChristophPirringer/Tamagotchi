class Tamagotchi
  attr_reader :name, :food, :sleep, :activity
  define_method(:initialize) do |name|
    @name = name
    @food = 5
    @sleep = 5
    @activity = 5
  end

  define_method(:set_food) do |new_level|
    @food = new_level
  end

  define_method(:set_sleep) do |new_level|
    @sleep = new_level
  end

  define_method(:set_activity) do |new_level|
    @activity = new_level
  end

  define_method(:dead?) do
    if @food == 0 || @sleep == 0
      true
    else
      false
    end
  end

  define_method(:day_passes) do
    @food -= 1
    @sleep -= 1
    @activity -= 1
  end

  define_method(:feed) do
    @food += 2
  end

  define_method(:nap) do
    @sleep += 1
  end

  define_method(:play) do
    @activity += 2
  end

end
