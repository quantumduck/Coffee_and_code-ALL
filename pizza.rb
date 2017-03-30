class Pizza

  def initialize (toppings)
    @toppings = toppings
    @cooked = false
    @cut = false
    @slices = 1
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
    @cooked
  end

  def cut(numslices = 10)
    if (numslices.to_i > 0)
      if @cooked
        @slices = numslices.to_i
        @cut = true
        puts "You cut your pizza into #{@slices} slices."
      else
        puts "Please bake your pizza first."
      end
    else
      puts "You fail. Pick a positive number of slices."
    end
    @slices
  end

  def eat(numslices = 1)
    if !@cooked
      puts "Please bake your pizza first."
    elsif @burnt
      puts "Your pizza is burnt and inedible."
    else
      if (@slices == 0)
        puts "You have no pizza left."
      elsif (!@cut)
        @slices = 0
        puts "You ate the whole pizza, you pig."
      elsif (@slices ==1)
        @slices = 0
        puts "You finished your pizza."
      else
        @slices -= 1
        puts "You ate a slice. You have #{@slices} left."
      end
    end
  end

end
