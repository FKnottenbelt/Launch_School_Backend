# tic_tac_toe.rb
# ==================
# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!
# ===========================
# Step 1: Set up and display the board (done)
# Step 2: Player turn (done)
# Step 3: The main game loop (done)
# Step 4: Determining the winner (done)
# Step 5: Play again (done)
# Step 6: refactor with rubocop (done)
# add joiner (done)
# keep score (done)
# Computer AI: Defense (done)
# Computer AI: Offense (done)
# Computer turn refinements
# => a) computer playes offence first (done)
# => b) pick square #5 if it's available (done)
# => c) pick who plays first
# Improve the game loop
# => a) implement place_piece! (done)
# => b) implement alternate_player (done)
# => c) change game loop (done)

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_SCORE = 2
FIRST_PLAYER = 'choose' # "player", "computer", or "choose".

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear' || system(cls)
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  clear_screen
  puts "You are a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    open_squares = joinor(empty_squares(brd))
    prompt "Choose a square (#{open_squares}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = find_at_risk_square(brd, COMPUTER_MARKER)
  square = find_at_risk_square(brd, PLAYER_MARKER) if square.nil?
  square = 5 if square.nil? && brd[5] == INITIAL_MARKER
  square = empty_squares(brd).sample if square.nil?
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def update_score(score, round_winner)
  score[round_winner.downcase.to_sym] += 1
end

def display_score(score)
  puts <<-MSG
       The score is:
       You: #{score[:player]} - Computer: #{score[:computer]}
  MSG
end

def find_at_risk_square(brd, marker)
  at_risk_square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      at_risk_square = line.select { |square| brd[square] == INITIAL_MARKER }
      break if !at_risk_square.empty?
    end
  end
  at_risk_square.nil? ? nil : at_risk_square[0]
end

def set_first_player
  case FIRST_PLAYER
  when 'choose'
    prompt "Who plays first? (player/computer)"
    answer = gets.chomp
    answer
  when 'player'
    'player'
  when 'computer'
    'computer'
  end
end

def alternate_player(player)
  player == 'player' ? 'computer' : 'player'
end

def place_piece!(brd, current_player)
  case current_player
  when 'player'
    player_places_piece!(brd)
  when 'computer'
    computer_places_piece!(brd)
  end
end
##############################################################
clear_screen
puts <<-MSG
                     Welcome to Tic Tac Toe!

                 We will play #{WINNING_SCORE} rounds per match
             First one to win #{WINNING_SCORE} rounds wins the match!

        MSG

loop do # main
  score = { player: 0, computer: 0 }
  current_player = set_first_player

  loop do # match
    board = initialize_board

    loop do
      display_board(board) if current_player == 'player'
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end # end round

    display_board(board)

    if someone_won?(board)
      round_winner = detect_winner(board)
      prompt "#{round_winner} won this round!"
      update_score(score, round_winner)
    else
      prompt "It's a tie!"
    end

    display_score(score)

    if score.values.include?(WINNING_SCORE)
      match_winner = score.key(WINNING_SCORE).capitalize
      prompt "#{match_winner} won this match!"
      break
    else
      prompt "Do you want to continue this match? (y/n)?"
      answer = gets.chomp
      break unless answer.downcase.start_with?('y')
    end
  end # end match

  prompt "Play a new match? (y/n)?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # end main

prompt "Thanks for playing Tic Tac Toe. Good bye!"
