class Gif < ActiveRecord::Base
  validates :url, :title, presence: { message: "can't be blank"}
end
