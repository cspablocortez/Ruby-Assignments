class Game
  attr_accessor :over, :board
  def initialize
    self.over = false
    puts %(
    +++ WELCOME TO RUBY TIC-TAC-TOE +++
    )
    self.board  = %(
      1 | 2 | 3
    ----+---+----
      4 | 5 | 6
    ----+---+----
      7 | 8 | 9
  )
  end

  def show_instructions
    puts %(
    Instructions:
      To move, simply type in the number of the cell you wish to play. 
    )
    puts board
  end

  def update_board(player_move)
    symbol = player_move[:symbol]
    cell   = player_move[:cell]
    index  = self.board.index(cell)
    self.board[index] = symbol if self.board.include? cell
    puts board
  end

  def show_end_message
    puts "GAME OVER."
  end

  
end

class Player
  attr_reader :name
  @@count = 0
  def initialize
    @@count += 1
    print "Player #{@@count}, enter your name: " 
    @name = gets.chomp.capitalize
    @symbol = @@count == 1 ? 'X' : 'O'
    puts "#{@name}, you will play as '#{@symbol}'\n\n"
  end

  def move
    print "#{@name}'s turn: "
    cell = gets.chomp
    # return a hash with player's symbol and their choice
    return {
      symbol: @symbol,
      cell: cell
    }
  end
end


game = Game.new
p1 = Player.new
p2 = Player.new
game.show_instructions

game.update_board(p1.move)
game.update_board(p2.move)
