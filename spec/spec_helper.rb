require 'rspec'
require 'simplecov'

SimpleCov.start

require 'file_generator'

Dir[File.join(Dir.pwd, "spec/support/**/*.rb")].each {|f| require f}

