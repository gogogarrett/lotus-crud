require_relative './environment'
require 'bundler/setup'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'
require_relative '../apps/admin/entities/user'
require_relative '../apps/admin/repositories/user'

module Mapper
  @@mapper = ::Lotus::Model::Mapper.new do
    collection :users do
      entity ::User

      attribute :id,   Integer
      attribute :name, String
    end
  end

  def self.mapper
    @@mapper
  end

  def self.load!
    adapter = ::Lotus::Model::Adapters::SqlAdapter.new(mapper, "sqlite://db/slitr.db")
    ::UserRepository.adapter = adapter
    mapper.load!
  end
end
