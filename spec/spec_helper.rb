# set up db:
require File.join(File.dirname(__FILE__), 'db_setup')

# require the null_object plugin:
Dir[File.join(File.dirname(__FILE__), '..', 'lib/*.rb')].each do |file|
  require file
end

# require null object classes needed for specs
Dir[File.join(File.dirname(__FILE__), 'null_objects/*.rb')].each do |file|
  require file
end

# require model classes needed for specs
Dir[File.join(File.dirname(__FILE__), 'models/*.rb')].each do |file|
  require file
end