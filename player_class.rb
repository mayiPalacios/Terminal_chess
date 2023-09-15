class Player
    attr_accessor :winner, :turn
  
    def initialize
      @winner = 0
      @turn = false
    end
  end

  class White < Player
    def initialize
      super
      @turn = true
    end
  end
  
  class Black < Player
    def initialize
      super
    end
  end