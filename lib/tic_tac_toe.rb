require 'pry'

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal from top left to bottom right
  [2,4,6] # Diagonal from top right to bottom left
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i
  index = user_input - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  # check for a valid move. Optional add in a check for the position taken
  if index.between?(0,8) # checks if move is valid
    if !position_taken?(board, index) # optional check to see if the position is taken. States if position_taken? not evaluates to True, then execute next line
      true
    end
  end
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets)
  if !valid_move?(board, index)
    turn(board)
  end
  move(board, index, token='X')
  display_board(board)
end

def turn_count(board)
  turns = board.select do |position|
    position = 'X' || position = 'Y'
    turns = turns.length
  end
end
