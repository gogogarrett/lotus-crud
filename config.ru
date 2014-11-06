require_relative 'apps/admin/application'
# require_relative 'apps/frontend/application'

require_relative './config/environment'

run Lotus::Router.new {
  mount Admin::Application,  at: '/admin'
  # mount Slitr::Frontend::Application, at: '/'
}
