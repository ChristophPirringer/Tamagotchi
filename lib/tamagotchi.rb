class Tamagotchi
  @@tamagotchis = []
  @@backgrounds = {alive: "http://orig10.deviantart.net/0971/f/2013/242/4/b/kittylarge_by_ate_bit-d6kb87n.gif",
    dead: "http://img-cache.cdn.gaiaonline.com/0f68eca0345f973a9f2be2eba829ab9c/http://i288.photobucket.com/albums/ll194/mediocreseed/tumblr_m0ul9z25Di1qb274l_zpsre66tqt4.gif"}

  attr_reader :name, :food, :sleep, :activity
  define_method(:initialize) do |name|
    @name = name
    @food = 5
    @sleep = 5
    @activity = 5
    @happiness = @sleep + @food + @activity
  end

  define_singleton_method(:clear) do
    @@tamagotchis = []
  end

  define_singleton_method(:backgrounds) do
    @@backgrounds
  end

  define_method(:save) do
    @@tamagotchis.push(self)
  end

  define_singleton_method(:dave) do
    @@tamagotchis[0]
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

  define_method(:set_happiness) do |new_level|
    @happiness = new_level
  end

  define_method(:dead?) do
    if @food == 0 || @sleep == 0
      true
    else
      false
    end
  end

  define_method(:read_happiness) do
    @happiness = @sleep + @food + @activity
  end

  define_method(:day_passes) do
    @food -= 2
    @food = 0 if @food < 0
    @sleep -= 1
    @sleep = 0 if @sleep < 0
    @activity -= 2
    @activity = 0 if @activity < 0
  end

  define_method(:feed) do
    @food += 2
    @food = 5 if @food > 5

  end

  define_method(:nap) do
    @sleep += 1
    @sleep = 5 if @sleep > 5
  end

  define_method(:play) do
    @activity += 2
    @activity = 5 if @activity > 5
  end

  define_method(:message) do
    if @food == 0 || @sleep == 0
      "..."
    elsif @food <= 2
      "I am hungry, feed me!"
    elsif @sleep <= 2
      "I am tired, let me sleep!"
    elsif @activity <= 1
      "I am bored, play with me!"
    else
      "Meowr!"
    end
  end

  define_method(:mood) do
    read_happiness()
    if @happiness == 0
      'Dead'
    elsif @happiness <= 5
      "Dying"
    elsif @happiness <= 6
      'Panicked'
    elsif @happiness <= 8
      "Distressed"
    elsif @happiness <= 10
      "Grumpy"
    elsif @happiness <= 12
      'OK'
    elsif @happiness <= 14
      'Happy!'
    else
      'Ecstatic'
    end
  end

end
