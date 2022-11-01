class Users::SessionsController < Devise::SessionsController
  layout 'users/login'

  before_filter :before_signin, :only => [:create]
  after_filter :after_signin, :only => [:create]

  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    #set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    if session[:user_return_to]
      respond_with resource, :location => session[:user_return_to]
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end

  private
  def after_sign_in_path_for(resource)
    users_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def before_signin
    # do something
  end

  def after_signin
    # do something
  end
end