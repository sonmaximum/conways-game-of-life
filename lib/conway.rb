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
  end

  def check_turn
    cell_arr.each do |cell|
      cell.neighbors_array
      cell.check_neighbors
      cell.check_status
    end
    dying_cells = cell_arr.select { |cell| cell.dying }
    born_cells = cell_arr.select { |cell| cell.being_born }
    dying_cells.each { |cell| cell.die }
    born_cells.each { |cell| cell.born }
  end

  def create_living_cell(x, y)
    cell = cell_arr.find do |cell|
      cell.x == x && cell.y == y
    end
    cell.live
  end

  def start_game
    loop check_turn
  end

  attr_accessor :cell_arr
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
      self.liveNeighbors += 1 if cell.alive
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
end

game = Gameboard.new(5, 5)
puts game.cell_arr
