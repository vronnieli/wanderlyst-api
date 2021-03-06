module Api
	module V1
		class SessionsController < ApplicationController
			skip_before_action :authenticate

			  def create
			  	# binding.pry
			    user = User.find_by(email: params[:email])
			    if user.authenticate(params[:password])
			      jwt = Auth.issue({id: user.id})
			      render json: {jwt: jwt}
			    else
			    end
			  end

			  private
			    def auth_params
			      params.require(:auth).permit(:email, :password)
			    end
		end
	end
end