class Tamagotchi

  define_method(:initialize) do |name|
    @name = name
    @food = 5
    @sleep = 5
    @activity = 5
  end

  define_method(:name) do
    @name
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

end
