  class PhotosController < ApplicationController

    require "date"
    
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

    def insert_photo_record
      the_image = params.fetch("input_image")
      the_caption = params.fetch("input_caption")

      #the_owner_username = params.fetch("input_owner_id")
      #matching_users = User.where({ :username => the_owner_username })
      #the_owner_id = matching_users.at(0).id
      the_owner_id = params.fetch("input_owner_id")

      @the_photo = Photo.new
      @the_photo.image = the_image
      @the_photo.caption = the_caption
      @the_photo.owner_id = the_owner_id

      @the_photo.created_at = Time.now
      @the_photo.updated_at = Time.now

      @the_photo.save

      the_redirect = "/photos/" + @the_photo.id.to_s
      redirect_to(the_redirect)
    end

    def delete_photo
      the_id = params.fetch("path_id")
      matching_photos = Photo.where({ :id => the_id })
      @the_photo = matching_photos.at(0)

      @the_photo.delete

      redirect_to("/photos")
    end

    def update_photo
      the_id = params.fetch("path_id")
      matching_photos = Photo.where({ :id => the_id })
      @the_photo = matching_photos.at(0)
      
      new_image = params.fetch("input_image")
      new_caption = params.fetch("input_caption")

      @the_photo.image = new_image
      @the_photo.caption = new_caption
      @the_photo.save

      the_redirect = "/photos/" + @the_photo.id.to_s
      redirect_to(the_redirect)
    end

    def insert_comment_record
      the_photo_id = params.fetch("input_photo_id")
      the_author_id = params.fetch("input_author_id")
      the_body = params.fetch("input_body")

      @the_comment = Comment.new
      @the_comment.body = the_body
      @the_comment.photo_id = the_photo_id
      @the_comment.author_id = the_author_id

      @the_comment.created_at = Time.now
      @the_comment.updated_at = Time.now

      @the_comment.save

      the_redirect = "/photos/" + @the_comment.photo_id.to_s
      redirect_to(the_redirect)
    end

  end