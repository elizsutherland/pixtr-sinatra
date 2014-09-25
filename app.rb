require "sinatra"
if development?
  require "sinatra/reloader"
end
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "photo_gallery"
  )

class Gallery < ActiveRecord::Base
end

class Image < ActiveRecord::Base
end

get "/" do
  @galleries = Gallery.all
  erb :home
end

get "/galleries/:id" do
  id=params[:id]
  gallery = Gallery.find(id)
  @name = gallery.name
  @image = Image.find(1)

  erb :gallery
end
