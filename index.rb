def intro
    puts '====== MASTERMIND ======'
    puts 'Greetings, noble traveler!'
    puts 'Beyond this door lies the ancient Vault of Ages. Only the worthy may unlock its treasures.'

    puts 'The colors at your disposal are: red, blue, green, yellow, black, and white.'
    puts 'You have 10 chances.'
    puts 'The code consists of a set of 4 different colors.'
    puts 'To enter your guess, separate each color with spaces (e.g., red blue green white).'
    puts '========================'
end

@colors = %w[red blue green yellow black white]
@the_code = []
@player_answer = []
@win = false

def init_codes
    4.times do 
        color = @colors.sample
        @the_code << color
        @colors.delete(color) #to exclude similar color
    end
    # puts @the_code    #for testing
end

def player_prompt
    print 'Enter guess: '
    input = gets.chomp
    @player_answer = input.split
    # puts @player_answer
end

def check_colors_and_locations
    black_pegs = 0 #correct color & location
    white_pegs = 0 #correct color, wrong location

    @the_code.each_with_index do |color, index|
        if color == @player_answer[index]
            black_pegs += 1
        elsif @the_code.include?(@player_answer[index])
            white_pegs += 1
        end
    end
    puts "     Correct color and location: #{black_pegs}."
    puts "     Correct color in the wrong location: #{white_pegs}."
    black_pegs
end

def check_winning(result)
    @win = (result == 4) 
end

def end_game
    if @win 
        puts 'You did it! The treasure shall be yours.'
    else
        puts 'Maybe hone your skills a tad more. Knock out 1000 push-ups a day or challenge a grizzly bear to a thumb wrestling match?'
    end
end

def play_again
    puts 'Ready for another round? (y/n)'
    input = gets.chomp
    if input == 'y' 
        @the_code = []
        @colors = %w[red blue green yellow black white] #reset the colors back
        play_game 
    end
end

def play_game
    @win = false
    intro
    init_codes
    10.times do |round|
        puts "Round: #{round+1}"
        player_prompt
        result = check_colors_and_locations
        puts '=================================='
        break if check_winning(result)
    end 
    end_game
    play_again
end

play_game