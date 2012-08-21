require 'rake/confirm/version'

load 'rake/confirm/tasks/confirm.rake'

if defined?(::Rails::Railtie)
  require 'rake/confirm/railtie'
end
