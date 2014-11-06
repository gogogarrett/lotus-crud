module Slitr
  module Frontend
    class Application < Lotus::Application
      configure do
        root File.dirname(__FILE__)
        load_paths << [
          'controllers',
          'views'
        ]

        # layout :frontend
        assets 'assets'

        routes do
          # resource :pages, only: [:show]
          # resource :users
        end
      end
    end
  end
end
