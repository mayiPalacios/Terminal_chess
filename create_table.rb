class Build_table 
    attr_accessor :hash_matrix

    def initialize()
       @hash_matrix = {}
    end
     

    def  create_chess_table()

        hash_matrix = {}
    
        (1..8).each do |row|
            hash_matrix[row] = []
        (1..8).each do |column|
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
     
        for i in 1..8 do 
         for j in 1..8 do
             hash_matrix[i][j] = "*"
         end     
        end
    
        hash_matrix[8][8] = "R"
        hash_matrix[8][7] = "N"
        hash_matrix[8][6] = "B"
        hash_matrix[8][5] = "K"
        hash_matrix[8][4] = "Q"
        hash_matrix[8][3] = "B"
        hash_matrix[8][2] = "N"
        hash_matrix[8][1] = "R"
    
        for i in 1..8 do
            hash_matrix[7][i] = "P"
        end
    
        hash_matrix[2][8] = "r"
        hash_matrix[2][7] = "n"
        hash_matrix[2][6] = "b"
        hash_matrix[2][5] = "k"
        hash_matrix[2][4] = "q"
        hash_matrix[2][3] = "b"
        hash_matrix[2][2] = "n"
        hash_matrix[2][1] = "r"
    
        for i in 1..8 do
            hash_matrix[1][i] = "p"
        end
    
    
       for i in 1..8 do 
        for j in 1..8 do
            print "#{hash_matrix[i][j]} "
        end
        puts "\n"
        
       end
    
       
      
    
    end

end