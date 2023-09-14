require './create_table.rb'


class Chess_game

    attr_accessor :chess_table
  
    def initialize()
        @chess_table =  Build_table.new().create_chess_table()
        puts @chess_table::hash_matrix
    end





end




# chesstable()

