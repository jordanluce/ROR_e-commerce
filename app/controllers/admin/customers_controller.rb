class Admin::CustomersController < Admin::BaseController

	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
		redirect_to admin_customers_path
	end

end