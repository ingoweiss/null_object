class Cover < ActiveRecord::Base
  belongs_to :book
  belongs_to :designer, :null_object => MissingDesigner.instance
end