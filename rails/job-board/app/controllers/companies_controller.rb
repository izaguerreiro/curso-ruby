class CompaniesController < ApplicationController
	def new
		@company = Company.new
	end

	def create
		@company = Company.new(params[:company])

		if @company.save
			redirect_to root_path, notice: "Company was successfully saved."
		else
			render action: "new"
		end
	end

	def show
		@company = Company.find(params[:id])
		render json: @company, except: [:encrypted_password], include: [:jobs]
	end
end