require './chess_game.rb'


class Game_class 
    attr_accessor :game_state
  
    def initialize(game_state)
        @game_state = game_state    
    end
     
    def menu
        until @game_state
        print "Welcome!! to chess game!"
        result = gets.chomp 

        if result == "chessgame"
         puts   game = Chess_game.new()
         game.start_game
            
        end

        if result == "--help"
        instructions_file = File.open('instructions.txt', 'r')
         contenido = instructions_file.read
      puts contenido

        end

        if result == "adios"
             @game_state =true
        end
       

        end
        end


        

end

chess = Game_class.new(false)

chess.menu
