class Player
    attr_accessor :puntaje, :turno
  
    def initialize
      @puntaje = 0
      @turno = false
    end
  end

  class White < Player
    def initialize
      super
      @turno = true
    end
  end
  
  class Black < Player
    def initialize
      super
    end
  end