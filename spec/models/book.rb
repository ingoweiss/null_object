class Book < ActiveRecord::Base
  has_one :cover, :null_object =>  MissingCover.instance
end