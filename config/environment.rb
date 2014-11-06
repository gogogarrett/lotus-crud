require_relative './mapper'

ENV["DATABASE_URL"] = "sqlite://db/slitr.db"

Mapper.load!
