class Users::PasswordsController < Devise::SessionsController
  layout false
  
  def new
    super
  end

end