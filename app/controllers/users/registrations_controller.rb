class Users::RegistrationsController < Devise::RegistrationsController
  layout false
  
  def new
    super
  end
end