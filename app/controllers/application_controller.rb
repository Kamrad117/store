class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  before_filter {:authenticate_user! || :authenticate_admin_user!}

  rescue_from ActionController::RoutingError, :with => :route_not_found
  rescue_from ActionController::MethodNotAllowed, :with => :invalid_method
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_ability
    if current_admin_user
      @current_ability ||= Ability.new(current_admin_user)
    elsif current_user
      @current_ability ||= Ability.new(current_user)
    else
      @current_ability ||= Ability.new(User.new)
    end
  end

  [:route_not_found, :invalid_method, :record_not_found].each do |method|
    define_method(method) do
      flash[:alert]= t(method)
      redirect_to root_path
    end
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end


  def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
   end

   helper_method :current_cart

end
