require "ostruct"
require "yaml"

module Helpers

  def load_formats(path = "/spec/formats.yml")
    formats_file = File.join(Dir.pwd, path)
    if File.exists?(formats_file)
      conf = YAML.load(File.read("#{Dir.pwd}#{path}"))
      OpenStruct.new(conf)
    else
      "missing formats file."
    end
  end

end

RSpec.configuration.include Helpers

