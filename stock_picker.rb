def stock_picker stock_prices

	max_profit = 0
	buy_sell = []

	stock_prices.each do |buy_price|
		future_prices = stock_prices[stock_prices.index(buy_price)..stock_prices.length] #Array of prices coming after the current price to compare differences

		future_prices.each do |sell_price|
			current_profit = sell_price - buy_price 

			if current_profit > max_profit
				max_profit = current_profit
				buy_sell[0] = stock_prices.index(buy_price)
				buy_sell[1] = stock_prices.index(sell_price)
			end		
		end
	end

	unless max_profit <= 0
		"The greatest profit to be made is $#{max_profit} if you buy/sell on days #{buy_sell} respectively."
	else
		"Sorry, there's no way to beat the market this week."
	end 
end

stock_prices = [17,3,6,9,15,8,6,1,10]
puts stock_picker(stock_prices)

stock_prices = [1, 2, 3, 10]
puts stock_picker(stock_prices)

stock_prices = [10, 1, 2, 3]
puts stock_picker(stock_prices)

stock_prices = [10, 3, 2, 1]
puts stock_picker(stock_prices)