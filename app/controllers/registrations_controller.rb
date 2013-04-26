class RegistrationsController < Devise::RegistrationsController
   
  def create  
  secret_code = SecretCode.get_for_signup(params[:secret_code][:code])  
  if secret_code          
      User.create_user_with_secret_code(params[:user], secret_code) 
      redirect_to root_path
   else
    flash[:notice] = "Invalid secret Code"
    render :action => "new"
  end 
  end  
end
