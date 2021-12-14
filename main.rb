# frozen_string_literal: true

require_relative 'knight'

knight = Knight.new
knight.move([1, 1], [8, 8])
p knight.path
