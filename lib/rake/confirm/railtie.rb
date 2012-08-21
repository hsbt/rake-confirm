module Rake
  module Confirm
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "rake/confirm/tasks/rails/confirm.rake"
      end
    end
  end
end
