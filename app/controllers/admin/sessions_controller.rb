class Admin::SessionsController < Admin::BaseController

	before_action :authorize, except:[:new, :create]

	layout 'admin_session'

	def new
	end

	def create
	end

	def destroy
	end
end