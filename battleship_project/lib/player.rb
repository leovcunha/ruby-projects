class Player
    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        move = gets.chomp
        move.split(" ").map{|el| el.to_i}
    end
end
