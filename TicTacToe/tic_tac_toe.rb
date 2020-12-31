class Game
  attr_accessor :over, :board, :cell_indices

  def initialize
    self.over = false
    puts %(
    +++ WELCOME TO RUBY TIC-TAC-TOE +++
    )
    self.board = %(
      1 | 2 | 3
    ----+---+----
      4 | 5 | 6
    ----+---+----
      7 | 8 | 9
  )
    self.cell_indices = [ [7, 11, 15],
                         [41, 45, 49],
                         [75, 79, 83]]
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
    index  = board.index(cell)
    board[index] = symbol if board.include? cell
    puts board
  end

  def check_status # TODO: Rename method + Add a draw 
    rows = []
    cols = [[], [], []]
    diagonals = []
    cell_values = [[self.board[7], self.board[11], self.board[15]], 
                   [self.board[41], self.board[45], self.board[49]], 
                   [self.board[75], self.board[79], self.board[83]]]  # TODO: Use self.cell_indices

    for i in 0..2
      rows[i] = cell_values[i]
      for j in 0..2
        cols[i].push(cell_values[j][i])
      end
    end

    # Vertical and Horizontal 
    for i in 0..2
      if rows[i].uniq.length == 1 || cols[i].uniq.length == 1
        self.over = true
        show_winner_message
      end
    end

    # Diagonals
    if cell_values[0][0] == cell_values[1][1] && cell_values[1][1] == cell_values[2][2]  
      self.over = true
      show_winner_message
    end

    if cell_values[0][2] == cell_values[1][1] && cell_values[1][1] == cell_values[2][0]  
      self.over = true
      show_winner_message
    end
  end

  private

  def show_winner_message
    puts 'WE HAVE A WINNER!' # TODO: Detect and congratulate winner.
  end

  def show_draw_message; end
end

class Player
  attr_reader :name

  @@slots_used = []
  @@count = 0
  def initialize
    @@count += 1
    @name = set_user_name
    @symbol = @@count == 1 ? 'X' : 'O'
    puts "#{@name}, you will play as '#{@symbol}'\n\n"
  end

  def move
    print "#{@name}'s turn: "
    cell = gets.chomp

    if @@slots_used.include?(cell) || !'0123456789'.include?(cell) || !cell.to_i.between?(0, 9)
      puts 'Please check your input and try again.'
      move
    else
      @@slots_used.push(cell)
      { symbol: @symbol, cell: cell }
    end
  end

  private

  def set_user_name
    print "Player #{@@count}, enter your name: "
    name = gets.chomp
    if name.length.zero? || name.strip.empty?
      puts 'Name cannot be empty. Please try again.'
      set_user_name
    else
      name.capitalize
    end
  end
end

game = Game.new
p1 = Player.new
p2 = Player.new
game.show_instructions

until game.over
  game.update_board(p1.move)
  game.check_status
  unless game.over
    game.update_board(p2.move)
    game.check_status
  end
end
