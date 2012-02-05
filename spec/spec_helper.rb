require 'file_generator'
require 'rspec'

Dir[File.join(Dir.pwd, "spec/support/**/*.rb")].each {|f| require f}

