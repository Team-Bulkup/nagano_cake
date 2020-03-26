class HomesController < ApplicationController
	def top
		@categories = Category.all
		@products = Product.offset(rand(Product.count)).first(4)
	end
end



# home.top.html.erbの記述。
# Home.top

# <% @products.each do|product| %>
# 		<%= product.image %>
# 		<%= product.name %>
# 		<%= product.no_tax_price %>
# 	<% end %>