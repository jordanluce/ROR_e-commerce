class Admin::OrdersController < Admin::BaseController
	def index
		@orders = Order.order('id DESC')
	end
end