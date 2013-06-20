class SessionsController < ApplicationController
	def new
		@chapters = Chapter.all
	end
	def create
		#Redirect to items page
		session[:chapter] = params[:section][:chapter]
		session[:admin] = false
		@chapters = Chapter.all

		#render 'new'
		redirect_to :controller => 'items'
	end
	def destroy
	end


end
