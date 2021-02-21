Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/photos", { :controller => "photos", :action => "index" })

  get("/users/:path_id", { :controller => "users", :action => "show" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/insert_user_record", { :controller => "users", :action => "insert_user_record" })
  get("/update_user/:path_id", { :controller => "users", :action => "update_user" })

  get("/insert_photo_record", { :controller => "photos", :action => "insert_photo_record" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete_photo" })
  get("/update_photo/:path_id", { :controller => "photos", :action => "update_photo" })

  get("/insert_comment_record", { :controller => "photos", :action => "insert_comment_record" })

end
