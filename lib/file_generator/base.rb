module FileGenerator
  class Base
    attr_accessor :headerformat
    attr_accessor :bodyformat
    attr_accessor :footerformat

    def initialize(headerformat, bodyformat, footerformat)
      @headerformat = headerformat
      @bodyformat = bodyformat
      @footerformat = footerformat
    end

    def generate_file(records) #bank is string and codes is an array
      file = []
      fh = process_hf(@headerformat)
      file << fh
      records.each do |record|
        fb = process_body(@body_format, record)
        file << fb
      end
      ff = process_hf(@footer_format)
      file << ff
      file = file.join("\n")
      file
    end

    private

    def process_hf(format, records)
      row = ''
      attributes = split_format(format)
      attributes.each do |attrib|
        behaviors = split_behaviors(attrib) # 0=>nombre, 1=>longitud, 2=> valor, 3=> relleno, 4 => alineado
        value = ''
        case behaviors[0]
          when 'nreg' then
            value = records.size.to_s
          when 'time' then
            value = Time.now.strftime("%Y%m%d")
          else
            value = behaviors[2]
        end
        if (behaviors[3] != '')
          if (behaviors[4] == 'I')
            row << value.ljust(behaviors[1].to_i, behaviors[3])
          else
            row << value.rjust(behaviors[1].to_i, behaviors[3])
          end
        else
          row << value
        end
      end
      row
    end

    def process_body(format, record)
      row = ''
      attributes = split_format(format)
      attributes.each do |attrib|
        behaviors = split_behaviors(attrib) # 0=>nombre, 1=>longitud, 2=> valor, 3=> relleno, 4 => alineado
        value = ''
        case behaviors[0]
          when record.attributes.has_key?(behaviors[0]) then
            value = record.attributes["#{behaviors[0]}"]
          when 'time' then
            value = Time.now.strftime("%Y%m%d")
          else
            value = behaviors[2]
        end
        if (behaviors[3] != '')
          if (behaviors[4] == 'I')
            row << value.ljust(behaviors[1].to_i, behaviors[3])
          else
            row << value.rjust(behaviors[1].to_i, behaviors[3])
          end
        else
          row << value
        end
      end
      row
    end

    # split the format in each behaviors
    def split_format(format)
      format.split(',')
    end

    # split the line pased
    # 0=>nombre, 1=>longitud, 2=> valor, 3=> relleno, 4 => alineado
    def split_behaviors(behavior)
      behavior.split(':')
    end

  end
end
