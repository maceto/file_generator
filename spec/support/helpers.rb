require "ostruct"
require "yaml"

module Helpers

  def load_formats
    formats_file = File.join(Dir.pwd, "/spec/formats.yml")
    if File.exists?(formats_file)
      conf = YAML.load(File.read("#{Dir.pwd}/spec/formats.yml"))
      OpenStruct.new(conf)
    else
      raise "missing formats file. "
    end
  end

end

RSpec.configuration.include Helpers

