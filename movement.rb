# frozen_string_literal = true

# Keeps track of knight moves
class Movement
  attr_reader :position, :parent

  AVAILABLE_MOVES = [[1, 2], [1, -2], [-1, 2], [-1, -2],
                     [2, 1], [2, -1], [-2, 1], [-2, -1]].freeze

  @@moves_done = []

  def initialize(position, parent)
    @position = position
    @parent = parent
    @@moves_done << position
  end

  def children
    all_possible_moves.map { |pos| Movement.new(pos, self) }
  end

  def self.valid?(position)
    position[0].between?(1, 8) && position[1].between?(1, 8)
  end

  private

  def all_possible_moves
    AVAILABLE_MOVES.map { |move| [@position[0] + move[0], @position[1] + move[1]] }
                   .keep_if { |pos| Movement.valid?(pos) }
                   .reject { |pos| @@moves_done.include?(pos) }
  end
end
