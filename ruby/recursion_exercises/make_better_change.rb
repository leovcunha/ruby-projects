def make_better_change(total, coins = [25, 10, 5, 1])
  best_change = []
    coins.each_with_index do |coin, index|
      next if total < coin

      remainder = total - coin

      this_change = [coin] + make_better_change(remainder, coins[index..-1])

      best_change = this_change if best_change.empty?
      best_change = this_change if this_change.length < best_change.length

    end
  best_change
end 

p make_better_change(14, coins = [10, 7 ,1])
