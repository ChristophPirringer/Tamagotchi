require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  before() do
    @dave = Tamagotchi.new("dave")
  end

  describe("#initialize") do
    it('sets the name of a new tamagotchi') do

      expect(@dave.name()).to(eq("dave"))
    end
  end

  describe("#dead") do
    it('checks if dave has starved and returns true for food==0') do
      @dave.set_food(0)
      expect(@dave.dead?()).to(eq(true))
    end

    it('checks if dave has starved and returns false for food==1') do
      @dave.set_food(1)
      expect(@dave.dead?()).to(eq(false))
    end

    it('checks if dave has died of sleep deprivation and returns true for sleep==0') do
      @dave.set_sleep(0)
      expect(@dave.dead?()).to(eq(true))
    end

    it('checks if dave has died of sleep deprivation and returns false for sleep==1') do
      @dave.set_sleep(1)
      expect(@dave.dead?()).to(eq(false))
    end
  end

  describe('#day_passes') do
    it('deincrements food, sleep and activity levels by 1') do
      @dave.day_passes()
      expect(@dave.activity()).to(eq(3))
    end
  end

  describe('#feed') do
    it('increments food by 2') do
      @dave.set_food(2)
      @dave.feed()
      expect(@dave.food).to(eq(4))
    end

    it('caps the food to a max of 5') do
      @dave.set_food(5)
      @dave.feed()
      expect(@dave.food).to(eq(5))
    end

  end

  describe('#nap') do
    it('increments sleep by 1') do
      @dave.set_sleep(1)
      @dave.nap()
      expect(@dave.sleep).to(eq(2))
    end
  end

  describe('#play') do
    it('increments activity by 2') do
      @dave.set_activity(1)
      @dave.play()
      expect(@dave.activity).to(eq(3))
    end
  end

  describe('#bored') do
    it('alerts the player if his tamagotchi is bored') do
      @dave.set_activity(0)
      @dave.bored()
      expect(@dave.bored).to(eq("I am bored, play with me!"))
    end
  end

end
