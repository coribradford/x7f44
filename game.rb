class Game

  WELCOME_MESSAGE = "Welcome to Shut da Box!"
  WINNING_MESSAGE = "You shut da box!"
  LOSING_MESSAGE = "Game over, you did not shut da box."

  attr_reader :box, :dice

  def initialize(box, dice)
    @box = box
    @dice = dice
  end

  def over?
    box.is_shut? || box.can_flip_dice_roll?(dice.map(&:value).reduce(:+))
  end

  def start!
    prepare_next_round
  end

  def prepare_next_round
    dice.each(&:roll!)
  end

  def play
    box.print_tiles()
    print "You rolled: "
    dice.each do |die|
      print "#{die.value} "
    end
    puts "\n"
    puts "Which tiles would you like to flip (separate by spaces): "
    tiles_to_flip = gets.chomp
    prepare_next_round
  end

  def results
    box.is_shut? ? WINNING_MESSAGE : LOSING_MESSAGE
  end

end
