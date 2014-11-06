require 'lotus'

module Admin
  class Application < ::Lotus::Application
    configure do
      root File.dirname(__FILE__)
      load_paths << [
        'controllers',
        'views'
      ]

      layout :application
      # assets 'assets'

      routes do
        # resource :pages
        resources :users
      end
    end
  end
end
