# frozen_string_literal: true

# class for gameboards
class Gameboard
  def initialize(width, height)
    @width = width
    @height = height
    @cell_arr = []
    0.upto(height - 1) do |y|
      0.upto(width - 1) do |x|
        @cell_arr.push(Cell.new(x, y, self))
      end
    end
    show_board
  end

  def take_turn
    cell_arr.each do |cell|
      cell.neighbors_array
      cell.check_neighbors
      cell.check_status
    end
    dying_cells = cell_arr.select { |cell| cell.dying }
    born_cells = cell_arr.select { |cell| cell.being_born }
    dying_cells.each { |cell| cell.die }
    born_cells.each { |cell| cell.born }
    system('clear')
    show_board
  end

  def make_alive(x, y)
    this_cell = cell_arr.find do |cell|
      cell.x == x && cell.y == y
    end
    this_cell.live
  end

  def start_game
    while true
      take_turn
      sleep(0.2)
    end
  end

  def set_up_gameboard
    board = []
    0.upto(width-1) do |x|
      board[x] = Array.new(height)
    end
    cell_arr.each do |cell|
      x = cell.x
      y = cell.y
      cell.alive ? board[y][x] = '█' : board[y][x] = '_'
    end
    board
  end

  def show_board
    board = set_up_gameboard
    board.each do |row|
      print row
      puts ''
    end
    puts '-' * width * 5
  end

  attr_accessor :width, :height, :cell_arr
end

# class for cells
class Cell
  def initialize(x, y, gameboard)
    @x = x
    @y = y
    @alive = false
    @gameboard = gameboard
    @dying = false
    @being_born = false
    @neighbors = []
    @live_neighbors = 0
  end

  def neighbors_array
    self.neighbors = []
    neighbors.push(gameboard.cell_arr.find do |cell|
      cell.x == x + 1 && cell.y == y
    end)
    neighbors.push(gameboard.cell_arr.find do |cell|
      cell.x == x - 1 && cell.y == y
    end)
    neighbors.push(gameboard.cell_arr.find do |cell|
      cell.x == x && cell.y == y + 1
    end)
    neighbors.push(gameboard.cell_arr.find do |cell|
      cell.x == x && cell.y == y - 1
    end)
    neighbors.push(gameboard.cell_arr.find do |cell|
      cell.x == x + 1 && cell.y == y + 1
    end)
    neighbors.push(gameboard.cell_arr.find do |cell|
      cell.x == x + 1 && cell.y == y - 1
    end)
    neighbors.push(gameboard.cell_arr.find do |cell|
      cell.x == x - 1 && cell.y == y + 1
    end)
    neighbors.push(gameboard.cell_arr.find do |cell|
      cell.x == x - 1 && cell.y == y - 1
    end)
  end

  def check_neighbors
    self.live_neighbors = 0
    neighbors.each do |cell|
      self.live_neighbors += 1 if (cell && cell.alive)
    end
  end

  def check_status
    if live_neighbors < 2 || live_neighbors > 3
      self.dying = true
    elsif live_neighbors == 3
      self.being_born = true
    end
  end

  def die
    self.alive = false
    self.dying = false
  end

  def born
    self.alive = true
    self.being_born = false
  end

  def live
    self.alive = true
  end

  def to_s
    "(#{x}, #{y})"
  end

  attr_accessor :x, :y, :alive, :neighbors, :gameboard, :live_neighbors, :dying, :being_born
end
# require_relative('lib/conway')
# Use 3-period pulsar as demo
system('clear')
game = Gameboard.new(40, 40)
game.make_alive(3, 1)
game.make_alive(4, 1)
game.make_alive(5, 1)
game.make_alive(9, 1)
game.make_alive(10, 1)
game.make_alive(11, 1)
game.make_alive(1, 3)
game.make_alive(6, 3)
game.make_alive(8, 3)
game.make_alive(13, 3)
game.make_alive(1, 4)
game.make_alive(6, 4)
game.make_alive(8, 4)
game.make_alive(13, 4)
game.make_alive(1, 5)
game.make_alive(6, 5)
game.make_alive(8, 5)
game.make_alive(13, 5)
game.make_alive(3, 6)
game.make_alive(4, 6)
game.make_alive(5, 6)
game.make_alive(9, 6)
game.make_alive(10, 6)
game.make_alive(11, 6)
game.make_alive(3, 8)
game.make_alive(4, 8)
game.make_alive(5, 8)
game.make_alive(9, 8)
game.make_alive(10, 8)
game.make_alive(11, 8)
game.make_alive(1, 9)
game.make_alive(6, 9)
game.make_alive(8, 9)
game.make_alive(13, 9)
game.make_alive(1, 10)
game.make_alive(6, 10)
game.make_alive(8, 10)
game.make_alive(13, 10)
game.make_alive(1, 11)
game.make_alive(6, 11)
game.make_alive(8, 11)
game.make_alive(13, 11)
game.make_alive(3, 13)
game.make_alive(4, 13)
game.make_alive(5, 13)
game.make_alive(9, 13)
game.make_alive(10, 13)
game.make_alive(11, 13)
# add one glider too
game.make_alive(17, 3)
game.make_alive(18, 3)
game.make_alive(19, 3)
game.make_alive(19, 2)
game.make_alive(18, 1)
game.start_game
