class Pizza

  def initialize (toppings)
    @toppings = toppings
    @cooked = false
    @cut = false
    @slices = 0
    @burnt = false
  end

  def bake
    if @cooked = false
      @cooked = true
      puts "Your pizza is ready!"
    else
      @burnt = true
      puts "You burnt your pizza :("
    end
  end

  def cut(numslices = 10)
    if (numslices.to_i > 0)
      if @cooked
        @slices = numslices.to_i
      else
        puts "Please cut your pizza first."
      end
      puts "You cut your pizza into #{@slices} slices."
    else
      puts "You fail. Pick an "
    end


end
