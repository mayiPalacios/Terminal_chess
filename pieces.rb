

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


  class Rook < Piece
    def move(hash_matrix)
  

    if @current_column[0] == @new_column[0]
       
      if @current_row < @new_row
        (@current_row[0]..@new_row[0] - 1).each do |position|
          if hash_matrix[position][current_column[0]] !="*"
                     return false
          end
        
      end
      return true
      end

      if @current_row > @new_row
        for i in (@current_row - 1).downto(@new_row + 1)
         
          if hash_matrix[i][current_column[0]] !="*"
                     return false
          end
        
      end
      return true
    end
   
  end

  if @current_row == @new_row
   
    if @current_column[0] < @new_column[0]
      ((@current_column[0] + 1)..@new_column[0] - 1).each do |position|
        if hash_matrix[current_row][position] !="*"
                   return false
        end
      
    end
    return true
    end

    if @current_column[0] > @new_column[0]
      for i in (@current_column[0] - 1).downto(@new_column[0] + 1)
        if hash_matrix[current_row][i] !="*"
                   return false
        end
      
    end
    return true
    end

end


  end
  end



class Pawn < Piece

    def move(hash_matrix) 
      
         if @piece_letter == "P" && @current_row == 6 && @current_row - @new_row == 2 && @current_column == @new_column
                return true
         end
        
         if @piece_letter == "p" && @current_row == 1 && @new_row - @current_row == 2 && @current_column == @new_column
            return true
     end

     if (@new_row - @current_row).abs == 1 && @current_column == @new_column
      if hash_matrix[current_row[0]][current_column[0]] !="*" && (@new_row - @current_row).abs == 1 && (@current_column[0] - @new_column[0])
        return true
  end
        return true
    end

    if (@new_row.to_i - @current_row.to_i).abs == 1 && (@current_column[0] - @new_column[0]).abs == 1
      return true
  end

  
    
    return false
end

  end


  class Knight < Piece
    def move()
      if (@new_row.to_i - @current_row.to_i).abs == 2 && (@current_column[0] - @new_column[0]).abs == 1
        return true
    end
    
    if (@new_row.to_i - @current_row.to_i).abs == 1 && (@current_column[0] - @new_column[0]).abs == 2
      return true
  end

    end
  end



class Bishops < Piece
  def move(hash_matrix)
    if (@current_row.to_i - @new_row.to_i).abs == (@current_column[0] - @new_column[0]).abs    
      if @current_row > @new_row
        i = @current_row - 1
        j = @current_column[0] + 1

        while i > @new_row && j < @new_column[0]
          if hash_matrix[i][j] != "*"
            return false
          end
          i -= 1
          j += 1
        end
      elsif @current_row < @new_row
        i = @current_row + 1
        j = @current_column[0] + 1

        while i < @new_row && j < @new_column[0]
          if hash_matrix[i][j] != "*"
            return false
          end
          i += 1
          j += 1
        end
      end
      true
    else
      false
    end
  end
end

class King < Piece
  def move
    if (@new_row.to_i - @current_row.to_i).abs == 1 && (@current_column[0] - @new_column[0]).abs == 1
      return true
  end

  if (@new_row.to_i - @current_row.to_i).abs == 1 && @current_column[0] == @new_column[0]
    return true
end

if @current_row == @new_row && (@current_column[0] - @new_column[0]).abs == 1
  return true
end

return false
  
  end
end
