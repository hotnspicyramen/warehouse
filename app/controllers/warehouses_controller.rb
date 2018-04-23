class WarehouseController < ApplicationController
	
	def index
	  @warehouse = Warehouse.paginate(page: params[:page])
	end

	def new
		@warehouse = Warehouse.new
	end

	def show
	  @warehouse = Warehouse.find(params[:id])
	  @user = User.find(warehouse.user_id)
	end

	def create
		@warehouse = current_user.warehouses.build(warehouse_params)
		@user = User.find(@warehouse.user_id)
		if @warehouse.save
		  flash[:success] = "Warehouse added!"
		  redirect_back_or @user
		else
		  render 'static_pages/home'
		end
	end

	def destroy
		warehouse = Warehouse.find(params[:id])
		warehouse.destroy
		flash[:success] = "warehouse deleted"
		redirect_back_or User.find(warehouse.user_id)
	end

	def edit
	  @warehouse = Warehouse.find(params[:id])
	end

	def update
	  @warehouse = Warehouse.find(params[:id])
	  @user = User.find(@warehouse.user_id)
	  if @warehouse.update_attributes(warehouse_params)
	    flash[:success] = "Warehouse updated"
	    redirect_back_or @user
	  else
	    render 'edit'
	  end
	end
	private

		def warehouse_params
		  params.require(:warehouse).permit(:name, :description, :address,
		                               :manager, :manager_email, :manager_phone_number,
		                               :region)
		end
end