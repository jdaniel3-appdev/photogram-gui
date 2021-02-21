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

    def insert_user_record
      the_username = params.fetch("input_username")
      @the_user = User.new
      @the_user.username = the_username
      @the_user.save

      #render({ :template => "user_templates/show.html.erb" })
      the_redirect = "/users/" + @the_user.username
      redirect_to(the_redirect)
    end

    def update_user
      the_username = params.fetch("path_id")
      matching_users = User.where({ :username => the_username })
      @the_user = matching_users.at(0)
      
      new_username = params.fetch("input_username")

      @the_user.username = new_username
      @the_user.save

      #render({ :template => "user_templates/show.html.erb" })
      the_redirect = "/users/" + @the_user.username
      redirect_to(the_redirect)
    end


  end
