class PagesController < ApplicationController
    
    def home
         redirect_to ptemples_path if logged_in?
    end
    
end