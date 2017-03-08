stocks = ARGV[0].strip.split(",") unless ARGV[0] == nil
puts stocks.to_s

picked_stocks = [0,0,0]

if (!ARGV[0])
  puts "List the stock prices in order of day(eg: 16,17,20,19,30) "
  stocks = gets.chomp.strip.split(",")
end

=begin
Take the stocks provided as the argument and find the best day to buy and sell.

Keep in mind that you can't sell until you buy. 

1) calculate the difference between each number and everything after it.


=end
def pick_stocks(array_of_stocks)
  differences = []
  array_of_stocks.each_with_index do |current_price, current_day|
    array_of_stocks.each_with_index  do |price_to_subtract, day_to_subtract|
      
      if(day_to_subtract < current_day)
        difference = current_price.to_f - price_to_subtract.to_f
        differences.push([day_to_subtract, current_day, difference])
      end
    end
  end
  differences_sorted = differences.sort_by(&:last)
  return differences_sorted.last
end

picked_stocks = pick_stocks(stocks)
puts "You should buy on day #{(picked_stocks[0] + 1)} and sell on day #{(picked_stocks[1] + 1)} with a profit of $#{('%.2f' % picked_stocks[2])} "