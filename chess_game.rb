require './create_table.rb'
require './player_class.rb'
require './pieces.rb'

class Chess_game

    attr_accessor :chess_table, :column_position_array, :hash_matrix 

   
    def initialize()
        @chess_table =  Build_table.new()
        @column_position_array = {"a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5,"g"=>6,"h"=>7}
        @hash_matrix = @chess_table.getMatrix()
        puts "si sale"
        puts  @hash_matrix
        @white_player = White.new
        @black_player = Black.new
        @game_over = false
    end
 
    def start_game
        until @game_over
          if @white_player.turno
            puts "White: Ingresa tu jugada (o escribe 'exit' para salir): "
          else
            puts "Black: Ingresa tu jugada (o escribe 'exit' para salir): "
          end
    
          input = gets.chomp
    
          if input.downcase == 'exit'
            @game_over = true
          else
            process_move(input)
            switch_turn
          end
        end
      end

      def process_move(move)
        if move.length < 5 || move.length > 5
           puts "invalid move"
        else move_condition = move.split('')
        end
        
        case move_condition[0]
       
        when "P"
            position = move_condition[1].to_i
            puts column_position_array[move_condition[2]]
            if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "P" 
                pawn_object = Pawn.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                puts  pawn_object.move()
           else return "invalid element"      
           end
            
            
       # when  "r"
        #    when "k"       
            #when "q"
            #when "n"
            #when  "b"
              # when  "R"
        #    when "K"       
            #when "Q"
            #when "N"
            #when  "B"
        end
        end
     
    
      def switch_turn
        @white_player.turno = !@white_player.turno
        @black_player.turno = !@black_player.turno
      end

    


end




# chesstable()

