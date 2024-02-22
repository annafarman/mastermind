p '====== MASTERMIND ======'


@colors = %w[red blue green yellow]
@the_answer = []

4.times do 
    color = @colors.sample
    @the_answer << color
    @colors.delete(color) #to ensure there is no color repetition
end

# p @the_answer


def play_game

end

play_game