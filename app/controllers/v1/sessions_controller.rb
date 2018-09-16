class V1::SessionsController <  ApplicationController
	def create
		 user = User.where(email: params[:email]).first
		if user and user.valid_password?(params[:password])
			user.update(:last_sign_in_at => Time.now.strftime("%H:%M:%S"), :last_sign_in_ip => request.ip)
			render json: user.as_json(only: [:id, :email, :name,:balance,:last_sign_in_at,:last_sign_in_ip,:authentication_token]), status: :created
		else
			render json: { errors: { 'email or password' => ['las credenciales no corresponden'] } }, status: :unprocessable_entity
		end

end

	def destroy 
		current_user&.authentication_token = nil
		if current_user.save
			head(:ok)
		else
			head(:unauthorized)
		end
	end


end