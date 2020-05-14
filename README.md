# MeowDB.rb
![Version](https://img.shields.io/gem/v/meowdb) ![Downloads](https://img.shields.io/gem/dt/meowdb) ![License](https://img.shields.io/badge/License-MIT-green)

"Database" in JSON (Ruby Gem).

**Released v1.0.0**.

## Installation
- `gem install meowdb`.

or

- Add `gem 'meowdb'` in your `Gemfile` and run `bundle install`.


## Usage
```rb
require "meowdb"

db = MeowDB.new(dir: __dir__, name: "test")

# Object creation (only if it doesn't exist)
object = db.create("0001", {
  "name" => "David",
  "country" => "CO",
  "info" => "Nothing to show"
})
puts(object)

# Obtaining an object
object = db.get("0001")
puts(object)

# List of objects
object = db.all()
temp = ""
object.each do |k, v|
  temp += "   - #{v["name"]} (#{k})\n"
end
puts(temp)

# Deleting an object
object = db.delete("0001")
puts(object)

# Average time of execution: 41.5ms.
```

## "Documentation"
- `MeowDB.new(options)`
    * `create(id, startValue)`
    * `exists(id)`
    * `get(id)`
    * `set(id, value)`
    * `all()`
    * `delete(id)`



### MeowDB.new(options)
Creates or gets a database.

**Parameters**:
* `options` - An object with the options
    * `options.dir` - A string indicating the directory that will have the database
    * `options.name` - A string with the name of the database


**Methods**:
* `create(id, initial_value)` - Creates an element in the database with the specified ID and sets it's value.
* `exists(id)` - Returns true if exists an element with that ID, returns false if not.
* `get(id)` - Returns the value of the element stored with that ID.
* `set(id, value)` - Sets the value of an element.
* `all()` - Returns all objects stored in the database.
* `delete(id)` - Deletes an element from the database.