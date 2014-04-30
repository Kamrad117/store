class LineItemsController < ApplicationController

def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    @line_item.save!
    flash.now[:notice] = t(:product_added)
  end

  def update
    @line_item.update_attributes(params[:line_item])
    respond_with(@line_item, location: line_item_path(@line_item))
  end

  def destroy
    @line_item.destroy
    redirect_to line_items_path
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity, :cart_id, :order_id)
    end
end

