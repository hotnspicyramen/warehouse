class ProductsController < ApplicationController
	
	def index
	  @products = Product.paginate(page: params[:page])
	end

	def new
		@product = Product.new
	end

	def show
	  @product = Product.find(params[:id])
	  @user = User.find(product.user_id)
	end

	def create
		@product = current_user.products.build(product_params)
		@user = User.find(@product.user_id)
		if @product.save
		  flash[:success] = "Product added!"
		  redirect_back_or @user
		else
		  render 'static_pages/home'
		end
	end

	def destroy
		product = Product.find(params[:id])
		product.destroy
		flash[:success] = "Product deleted"
		redirect_back_or User.find(product.user_id)
	end

	def edit
	  @product = Product.find(params[:id])
	end

	def update
	  @product = Product.find(params[:id])
	  @user = User.find(@product.user_id)
	  if @product.update_attributes(product_params)
	    flash[:success] = "Product updated"
	    redirect_back_or @user
	  else
	    render 'edit'
	  end
	end
	private

		def product_params
		  params.require(:product).permit(:name, :description, :quantity,
		                               :price, :region)
		end
end
