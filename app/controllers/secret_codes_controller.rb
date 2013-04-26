class SecretCodesController < ApplicationController
 layout "application"
 load_and_authorize_resource
def index
  @codes = SecretCode.all  
end
  

def create
  if params[:value]
    (1..params[:value].to_i).each do |code|
      secret_code = (0..6).map{ rand(36).to_s(36) }.join
     status =  SecretCode.create!(:code => secret_code) && status
     if status 
       redirect_to :action => "index"
     else
       flash[:notice] = "Generated Successfully"
       render :action => "index"
     end
    end
  else
    flash[:notice] = "Please select value"  
    render :action => "index"
  end 
  
end

end
