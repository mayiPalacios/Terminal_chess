require './create_table.rb'
require './player_class.rb'
require './pieces.rb'


class Chess_game

    attr_accessor :chess_table, :column_position_array, :hash_matrix, :king_die , :flag_king_die

   
    def initialize()
        @chess_table =  Build_table.new()
        @column_position_array = {"a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5,"g"=>6,"h"=>7}
        @hash_matrix = @chess_table.getMatrix()
        @king_die = ""
        @flag_king_die = false
        puts @hash_matrix.include?("K")
        @white_player = White.new
        @black_player = Black.new
        @game_over = false
    end
 
    def start_game
        until @game_over
          if @white_player.turn
            print "White:"
          else
            print "Black:"
          end
    
          input = gets.chomp
          
    
          if input.downcase == 'exit'
            @game_over = true
          else
            process_move(input)
            kings = false
            switch_turn
           
         
      if  @flag_king_die
        puts "¡The king #{king_die} its die"
        @game_over = true
      end
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
            if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "P" 
                knight_object = Pawn.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                if knight_object.move(hash_matrix)
                  if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "k"
                    @king_die = "k"
                    @flag_king_die = true
           end

                     if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "P"
                       @chess_table.print_table(hash_matrix)
                     else
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "P"
                      @chess_table.print_table(hash_matrix)
                     end
                    else puts "invalid move"
                      @chess_table.print_table(hash_matrix)  
                end
           else  print "invalid move"  
           end
            
          when "p"
            if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "p" 
                knight_object = Pawn.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                if knight_object.move(hash_matrix)
                  if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "K"
                    @king_die = "K"
                    @flag_king_die = true
           end
                     if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "p"
                       @chess_table.print_table(hash_matrix)
                     else
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "p"
                      @chess_table.print_table(hash_matrix)
                     end
                    else puts "invalid move"
                      @chess_table.print_table(hash_matrix)  
                end
           else  print "invalid move"  
           end
            
      
            when "k"      
              if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "k" 
                king_object = King.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                if king_object.move()
                     if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "k"
                       @chess_table.print_table(hash_matrix)
                     elsif hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "p" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "r" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "n" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "b" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "k"      
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "k"
                      @chess_table.print_table(hash_matrix)
                     else
                      puts "invalid move"
                     end
                    else puts "invalid move"
                      @chess_table.print_table(hash_matrix)  
                end
           else  print "invalid move"  
           end

            when "q"
             
              if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "q" 
                queen_object = Queen.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                if queen_object.move(hash_matrix)
                  if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "K"
                    @king_die = "K"
                    @flag_king_die = true
           end
                     if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "q"
                       @chess_table.print_table(hash_matrix)
                     elsif hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "p" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "r" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "n" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "b" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "k"     
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "q"
                      @chess_table.print_table(hash_matrix)
                     else
                      puts "invalid move"
                     end
                    else puts "invalid move"
                      @chess_table.print_table(hash_matrix)  
                end
           else  print "invalid move"  
           end

            
           
               when  "R"
                if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "R" 
                  rook_object = Rook.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                  if rook_object.move(hash_matrix)
                    if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "k"
                      @king_die = "k"
                      @flag_king_die = true
             end
                       if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "P" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "R" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "N" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "B" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "Q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "K"     
                        hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                        hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "R"
                         @chess_table.print_table(hash_matrix)
                       else puts "invalid move"
                       end 
                      else puts "invalid move"
                        @chess_table.print_table(hash_matrix)  
                  end
             else  print "invalid move"  
             end

            when  "r"
              if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "r" 
                rook_object = Rook.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                if rook_object.move(hash_matrix)
                  if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "K"
                    @king_die = "K"
                    @flag_king_die = true
           end
                     if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "p" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "r" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "n" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "b" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "k"     
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "r"
                       @chess_table.print_table(hash_matrix)
                     else puts "invalid move"
                     end 
                    else puts "invalid move"
                      @chess_table.print_table(hash_matrix)  
                end
           else  print "invalid move"  
           end

          when "K" 
            if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "K" 
              king_object = King.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
              if king_object.move()
                   if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                    hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                    hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "K"
                     @chess_table.print_table(hash_matrix)
                   elsif hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "P" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "R" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "N" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "B" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "Q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "K"     
                    hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                    hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "K"
                    @chess_table.print_table(hash_matrix)
                   else
                    puts "invalid move"
                   end
                  else puts "invalid move"
                    @chess_table.print_table(hash_matrix)  
              end
         else  print "invalid move"  
         end
            
            
            when "Q"
              if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "Q" 
                queen_object = Queen.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                if queen_object.move(hash_matrix)
                  if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "k"
                    @king_die = "k"
                    @flag_king_die = true
           end
                     if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "Q"
                       @chess_table.print_table(hash_matrix)
                     elsif hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "P" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "R" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "N" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "B" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "Q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "K"     
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "Q"
                      @chess_table.print_table(hash_matrix)
                     else
                      puts "invalid move"
                     end
                    else puts "invalid move"
                      @chess_table.print_table(hash_matrix)  
                end
           else  print "invalid move"  
           end


            when "N"
              if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "N" 
                knight_object = Knight.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
                if knight_object.move()
                  if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "k"
                    @king_die = "k"
                    @flag_king_die = true
           end
                     if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "N"
                       @chess_table.print_table(hash_matrix)
                     elsif hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "P" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "R" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "N" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "B" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "Q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "K"     
                      hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                      hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "N"
                      @chess_table.print_table(hash_matrix)
                     else
                      puts "invalid move"
                     end
                    else puts "invalid move"
                      @chess_table.print_table(hash_matrix)  
                end
           else  print "invalid move"  
           end

          when "n"
            if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "n" 
              knight_object = Knight.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
              if knight_object.move()
                if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "K"
                  @king_die = "K"
                  @flag_king_die = true
         end
                   if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                    hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                    hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "n"
                     @chess_table.print_table(hash_matrix)
                   elsif hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "p" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "r" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "n" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "b" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "k"     
                    hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                    hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "n"
                    @chess_table.print_table(hash_matrix)
                   else
                    puts "invalid move"
                   end
                  else puts "invalid move"
                    @chess_table.print_table(hash_matrix)  
              end
         else  print "invalid move"  
         end

              
              
        when  "B"
          if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "B" 
            bishops_object = Bishops.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
            if bishops_object.move(hash_matrix)
              if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "k"
                @king_die = "k"
                @flag_king_die = true
       end
                 if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                  hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                  hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "B"
                   @chess_table.print_table(hash_matrix)
                 elsif hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "P" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "R" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "N" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "B" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "Q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "K"     
                  hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                  hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "B"
                  @chess_table.print_table(hash_matrix)
                 else
                  puts "invalid move"
                 end
                else puts "invalid move"
                  @chess_table.print_table(hash_matrix)  
            end
       else  print "invalid move"  
       end

      when  "b"

        if hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] == "b" 
          bishops_object = Bishops.new(move_condition[0],move_condition[1].to_i,[column_position_array[move_condition[2]]],move_condition[3].to_i,[column_position_array[move_condition[4]]])
          if bishops_object.move(hash_matrix)
            if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "b"
              @king_die = "b"
              @flag_king_die = true
     end
               if hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] == "*"
                hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "b"
                 @chess_table.print_table(hash_matrix)
               elsif hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "p" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "r" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "n" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "b" &&hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "q" && hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] != "k"     
                hash_matrix[move_condition[1].to_i][column_position_array[move_condition[2]]] = "*"
                hash_matrix[move_condition[3].to_i][column_position_array[move_condition[4]]] = "b"
                @chess_table.print_table(hash_matrix)
               else
                puts "invalid move"
               end
              else puts "invalid move"
                @chess_table.print_table(hash_matrix)  
          end
     else  print "invalid move"  
     end

        end
        end
     
    
      def switch_turn
        @white_player.turn = !@white_player.turn
        @black_player.turn = !@black_player.turn
      end

    


end




# chesstable()

