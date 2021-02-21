  class UsersController < ApplicationController
    
    def index
      @list_of_users = User.all


      render({ :template => "user_templates/index.html.erb"})
    end

  end
