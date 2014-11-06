require 'sequel'
require 'sqlite3'
require_relative './environment'

class Migrator
  require 'lotus'
  def self.migrate!
    database = Sequel.connect(ENV["DATABASE_URL"])

    database.create_table! :users do
      primary_key :id
      String  :name
    end
  end
end
