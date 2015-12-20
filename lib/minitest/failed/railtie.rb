module Minitest
  module Failed
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load(File.expand_path(File.join(File.dirname(__FILE__), './tasks.rb')))
      end
    end
  end
end
