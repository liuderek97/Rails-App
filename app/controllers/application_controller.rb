class ApplicationController < ActionController::Base
  
  
 
  def after_sign_in_path_for(profile)
      puts "-----after sign in path-----"
      puts params
      if current_user.profile
        
              root_path
          else
              new_shoe_path
          end
      
  end

  def current_account
    current_user&.profile
  end
  helper_method :current_account
end