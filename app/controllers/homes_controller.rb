class HomesController < ApplicationController
	def top
  	# この記述でジャンルステータスが有効のカテゴリーのみ表示
	 	@categories = Category.where(is_enabled: true)
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