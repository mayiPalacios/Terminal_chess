class Build_table 
    attr_accessor :hash_matrix

    def initialize()
       @hash_matrix = {}
    end
     

    def  create_chess_table()
    
        (0..7).each do |row|
            hash_matrix[row] = []
        (0..7).each do |column|
          hash_matrix[row][column] = []
        end
    
    end
    
    fillMatrix(hash_matrix)
    
    end

    def getMatrix() 
        create_chess_table()
        return @hash_matrix
    end

    
    def fillMatrix(hash_matrix)
     
        for i in 0..7 do 
         for j in 0..7 do
             hash_matrix[i][j] = "*"
         end     
        end
    
        hash_matrix[7][7] = "R"
        hash_matrix[7][6] = "N"
        hash_matrix[7][5] = "B"
        hash_matrix[7][4] = "K"
        hash_matrix[7][3] = "Q"
        hash_matrix[7][2] = "B"
        hash_matrix[7][1] = "N"
        hash_matrix[7][0] = "R"
    
        for i in 0..7 do
            hash_matrix[6][i] = "P"
        end
    
        hash_matrix[0][7] = "r"
        hash_matrix[0][6] = "n"
        hash_matrix[0][5] = "b"
        hash_matrix[0][4] = "k"
        hash_matrix[0][3] = "q"
        hash_matrix[0][2] = "b"
        hash_matrix[0][1] = "n"
        hash_matrix[0][0] = "r"
    
        for i in 0..7 do
            hash_matrix[1][i] = "p"
        end
    

        print "  "
        ('a'..'h').each { |columna| print "#{columna} " }
        puts
        
        (0..7).each do |fila|
          print "#{fila} "
          
          (0..7).each do |columna|
            print "#{hash_matrix[fila][columna]} "
          end
          
          puts
        end
        
    
       
      
    
    end

end