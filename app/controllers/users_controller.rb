  class UsersController < ApplicationController
    
    def index
      @list_of_users = User.all


      render({ :template => "user_templates/index.html.erb"})
    end

    def show
      the_username = params.fetch("path_id")

      matching_users = User.where({ :username => the_username })
      @the_user = matching_users.at(0)

      render({ :template => "user_templates/show.html.erb" })
    end

  end
