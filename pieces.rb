class Piece
    attr_reader  :current_row, :current_column, :new_row, :new_column,:piece_letter

    def initialize(piece_letter,current_row, current_column,new_row,new_column)
      @piece_letter = piece_letter
      @current_row = current_row
      @current_column = current_column
      @new_row = new_row
      @new_column = new_column
    end
  
    def move
      raise NotImplementedError, "Subclasses must implement this method"
    end
  end
  
  class Pawn < Piece

    def move() 
         if @piece_letter == "P" && @current_row == 6 && @current_row - @new_row == 2 && @current_column == @current_column
                return true
         end
        
         if @piece_letter == "p" && @current_row == 1 && @new_row - @current_row == 2 && @current_column == @current_column
            return true
     end

     if (@new_row - @current_row).abs == 1
        return true
    end
    
    return false
end

  end

  class Queen < Piece
    def move
     
    end
  end

  class King < Piece
    def move
    
    end
  end


  class Bishops < Piece
    def move
     
    end
  end
  
  
  class Rook < Piece
    def move
     
    end
  end
  