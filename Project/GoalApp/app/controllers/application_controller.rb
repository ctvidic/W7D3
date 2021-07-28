class ApplicationController < ActionController::Base
   # - C - `#current_user`
   # - E - `#ensure_logged_in`
   # - L - `#login!(user)`
   # - L - `#logout!`
   # - L - `#logged_in?

   def current_user
      @current_user ||= User.find_by(session_token: session[:session_token])
   end

   def ensure_logged_in
      redirect_to new_session_url unless logged_in?
   end

   def login(user)
      session[:session_token] = user.reset_session_token!
   end

   def logout!
      current_user.reset_session_token! if logged_in?
      session[:session_token] = nil
      @current_user = nil
   end

   def logged_in?
      !!current_user
   end


end
