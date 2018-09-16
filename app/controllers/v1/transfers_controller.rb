class V1::TransfersController < ApplicationController
	def index 
		@transfers = Transfer.all
		render json: @transfers, status: :ok
		
	end

	def create
    	@transfer = current_user.transfers.build(transfer_params)
		if @transfer.save
		render json: @contact, status: :created
		else 
			head(:unprocessable_entity)
		end
	end

	def update
		@transfer = current_user.transfers.find(params[:id])
		if @transfer.update(transfer_params)
			render :update
		else 
			head(:unprocessable_entity)
		end

	end

	def destroy 
		@transfer = current_user.transfers.where(id: params[:id]).first
		if @transfer.destroy
			head(:ok)
		else 
			head(:unprocessable_entity)
		end
	end


	private
	def transfer_params
		params.require(:transfer).permit(:hs, :lender,:borrower,:value,:ts)
	end
end
