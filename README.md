# MeowDB.rb
![MeowDB](https://i.imgur.com/cC7AZ18.png)

![Downloads](https://img.shields.io/gem/dt/meowdb) ![Repository Size](https://img.shields.io/github/repo-size/Drylotrans/MeowDB.rb) ![License](https://img.shields.io/github/license/Drylotrans/MeowDB.rb) ![Last Commit](https://img.shields.io/github/last-commit/Drylotrans/MeowDB.rb) ![Version](https://img.shields.io/gem/v/meowdb)

Ruby implementation of the _"Database" in JSON ([Node.js library](https://github.com/Drylotrans/MeowDB.js))_!

**Released v1.0.0**.

## Installation
- `gem install meowdb`.

or

- Add `gem 'meowdb'` in your `Gemfile` and run `bundle install`.


## Usage
```rb
require "meowdb"

my_database = MeowDB.new(dir: __dir__, name: "database")

# Object creation (only if it doesn't exist)
object = my_database.create("0001", {
  "name" => "David",
  "country" => "CO",
  "info" => "Nothing to show"
})
puts(object)

# Obtaining an object
object = my_database.get("0001")
puts(object)

# Modifying an object and saving it
object["name"] = "Deivid"
object.save()
puts(object)

# Setting directly the value of an element
object = my_databse.set("0001.info", "Just a person")
puts (object)

# List of objects
object = my_database.all()
temp = ""
object.each do |k, v|
  temp += "   - #{v["name"]} (#{k})\n"
end
puts(temp)

# Deleting an object
object = my_database.delete("0001")
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