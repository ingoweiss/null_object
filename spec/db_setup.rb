require 'rubygems'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => ':memory:'
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
    
    create_table :books, :force => true do |t|
    end
    
    create_table :covers, :force => true do |t|
      t.column :book_id, :integer
      t.column :color, :string
    end
    
    create_table :designers, :force => true do |t|
      t.column :name, :string
    end
    
end