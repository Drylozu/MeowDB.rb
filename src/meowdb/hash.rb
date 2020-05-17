require_relative "error.rb"
require "json"

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

class MeowDBHash < Hash
  def initialize(hash, id, file)
    super()
    @__id = id if (id != "/")
    @file = file
    hash.each do |k, v|
      self[k] = v
    end
  end

  def __id
    return @__id
  end

  def save()
    all_data = JSON.parse(File.read(@file))
    info = ""
    if __id
      __id.split(".").each do |property|
        info += "[\"#{property}\"]"
      end
    end
    self.each do |k, v|
      unless (k.start_with?("__"))
        return MeowDBError.new("The value must be a string, number, hash, boolean, array or a nil") if !valid_value?(v)
        eval("all_data#{info}[\"#{k}\"] = #{stringify_data(v)}")
      end
    end    
    File.write(@file, JSON.generate(all_data))
    return eval("all_data#{info}")
  end
end