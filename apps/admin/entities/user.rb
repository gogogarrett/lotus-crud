require 'lotus/entity'

class User
  include Lotus::Entity
  self.attributes = :name
end
