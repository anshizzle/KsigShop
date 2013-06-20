module OrdersHelper
	def convert_size(size_num)
		if size_num == 1
			'Small'
		elsif size_num == 2
			'Medium'
		elsif size_num == 3
			'Large'
		elsif size_num == 4
			'X-Large'
		end
	end
end
