require('rspec')
require('tamagotchi')

describe(Tamagotchi) do

  describe("#initialize") do
    it('sets the name of a new tamagotchi') do
      @dave = Tamagotchi.new("dave")
      expect(@dave.name()).to(eq("dave"))
    end
  end

  describe("#dead") do
    it('checks if dave has starved and returns true for food==0') do
      @dave = Tamagotchi.new("dave")
      @dave.set_food(0)
      expect(@dave.dead?()).to(eq(true))
    end

    it('checks if dave has starved and returns false for food==1') do
      @dave = Tamagotchi.new("dave")
      @dave.set_food(1)
      expect(@dave.dead?()).to(eq(false))
    end
  end

end
