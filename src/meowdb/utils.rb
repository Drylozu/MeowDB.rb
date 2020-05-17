require "json"

class MeowDBUtils
  def initialize(file)
    @file = file
  end

  def valid_id?(id)
    return false if !id.is_a?(String)
    return false if id.length < 1
    return false if (id =~ /^[a-zA-Z0-9.]+$/).nil?
    return false if id.split(".").include?("")
    return false if id.end_with?(".")
    return true
  end

  def valid_value?(value)
    return true if value.is_a?(String)
    return true if value.is_a?(Integer)
    return true if value.is_a?(Hash)
    return true if value.is_a?(Array)
    return true if value.is_a?(TrueClass)
    return true if value.is_a?(FalseClass)
    return true if value.is_a?(NilClass)
    return false
  end

  def stringify_data(data)
    return "\"#{data}\"" if data.is_a?(String)
    return "#{data}" if data.is_a?(Integer)
    return "#{JSON.generate(data)}" if data.is_a?(Hash)
    return "[#{data.map{|e| self.stringify_data(e)}.join(",")}]" if data.is_a?(Array)
    return "nil" if data.is_a?(NilClass)
    return "#{data.to_s()}"
  end

  def get_all()
    return JSON.parse(File.read(@file))
  end

  def get(id)
    all_data = self.get_all()
    info = ""
    properties = id.split(".")
    properties.each do |property|
      info += "[\"#{property}\"]"
      if (properties.index(property) != (properties.length - 1))
        eval("all_data#{info} = {}") if (!eval("all_data#{info}"))
      end
    end
    return eval("all_data#{info}")
  end

  def set(id, data, create = false)
    all_data = self.get_all()
    info = ""
    properties = id.split(".")
    properties.each do |property|
      info += "[\"#{property}\"]"
      if (properties.index(property) == (properties.length - 1))
        last = eval("all_data#{info}")
        eval("all_data#{info} = #{self.stringify_data(data)}") unless last && create
      else
        eval("all_data#{info} = {}") if (!eval("all_data#{info}"))
      end
    end

    File.write(@file, JSON.generate(all_data))
    return eval("all_data#{info}")
  end
end