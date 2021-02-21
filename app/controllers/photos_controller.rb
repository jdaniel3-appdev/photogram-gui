  class PhotosController < ApplicationController
    
    def index
      @list_of_photos = Photo.all


      render({ :template => "photo_templates/index.html.erb"})
    end

    def show
      the_id = params.fetch("path_id")

      matching_photos = Photo.where({ :id => the_id })
      @the_photo = matching_photos.at(0)

      render({ :template => "photo_templates/show.html.erb" })
    end

  end