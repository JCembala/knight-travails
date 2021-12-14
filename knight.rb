# frozen_string_literal: true

require_relative 'movement'

# Knight class, only allows to move
class Knight

  def initialize
    @final_move = Movement.new([1, 1], nil)
    @path = []
  end

  def move(start_pos, end_pos)
    queue = []
    current_move = Movement.new(start_pos, nil)

    until current_move.position == end_pos
      current_move.children.each { |child| queue << child }
      current_move = queue.shift
    end
    @final_move = current_move
  end

  def path(final_move = @final_move)
    path(final_move.parent) unless final_move.parent.nil?
    @path.push(final_move.position)
  end
end
