require "meowdb/error.rb"
require "meowdb/hash.rb"
require "meowdb/utils.rb"
require "pathname"
require "json"

class MeowDB
  def initialize(dir: nil, name: "database")
    raise MeowDBError.new("The directory path is required") if !dir
    raise MeowDBError.new("The name of the database is required") if !name
    raise MeowDBError.new("The directory path must be an string") if !dir.is_a?(String)
    raise MeowDBError.new("The name of the database must be an string") if !name.is_a?(String)
    raise MeowDBError.new("The directory must be valid") if !Pathname.new(dir).directory?
    raise MeowDBError.new("The name must have more of one character") if name.length < 1
    raise MeowDBError.new("The name must only include letters, numbers and underscores") if !/^[a-zA-Z0-9_]+$/.match(name)

    @_options = {
      "dir" => dir,
      "name" => name
    }
    @_options["file"] = Pathname.new(@_options["dir"]).join("#{@_options["name"]}.json")
    @_utils = MeowDBUtils.new(@_options["file"])

    if !File.exist?(@_options["file"])
      File.write(@_options["file"], "{}")
    end
  end

  def all()
    return MeowDBHash.new(@_utils.get_all(), "/", @_options["file"])
  end
  
  def create(id, initial_value)
    return MeowDBError.new("The ID must only include letters, numbers, underscores and dots") if !@_utils.valid_id?(id)
    return MeowDBError.new("The value must be a string, number, hash, boolean, array or a nil") if !@_utils.valid_value?(id)
    return @_utils.get(id) if @_utils.get(id)
    object = @_utils.set(id, initial_value, true)
    return object.is_a?(Hash) ? object.merge!(__id: id) : object
  end

  def delete(id)
    return MeowDBError.new("The ID must only include letters, numbers, underscores and dots") if !@_utils.valid_id?(id)
    tmp_data = @_utils.get(id)
    return MeowDBError.new("That element doesn't exists in the database") if !tmp_data
    @_utils.set(id, nil, false)
    return tmp_data.is_a?(Hash) ? tmp_data.merge!(__id: id) : tmp_data
  end

  def exist?(id)
    return MeowDBError.new("The ID must only include letters, numbers, underscores and dots") if !@_utils.valid_id?(id)
    return true if @_utils.get(id)
    return false
  end

  def get(id)
    return MeowDBError.new("The ID must only include letters, numbers, underscores and dots") if !@_utils.valid_id?(id)
    data = @_utils.get(id)
    return data.is_a?(Hash) ? MeowDBHash.new(data, id, @_options["file"]) : data
  end

  def set(id, value)
    return MeowDBError.new("The ID must only include letters, numbers, underscores and dots") if !@_utils.valid_id?(id)
    return MeowDBError.new("The value must be a string, number, hash, boolean, array or a nil") if !@_utils.valid_value?(value)
    return @_utils.set(id, value, false)
  end
end