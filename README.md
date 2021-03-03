# MeowDB.rb
![MeowDB](https://i.imgur.com/cC7AZ18.png)

![Downloads](https://img.shields.io/gem/dt/meowdb) ![Repository Size](https://img.shields.io/github/repo-size/Drylozu/MeowDB.rb) ![License](https://img.shields.io/github/license/Drylozu/MeowDB.rb) ![Last Commit](https://img.shields.io/github/last-commit/Drylozu/MeowDB.rb) ![Version](https://img.shields.io/gem/v/meowdb)

Ruby implementation of the _"Database" in JSON ([Node.js library](https://github.com/Drylozu/MeowDB.js))_!

**Released v1.0.1**.

## Installation
- `gem install meowdb`.

or

- Add `gem 'meowdb'` in your `Gemfile` and run `bundle install`.


## Usage
```rb
require "meowdb"

my_database = MeowDB.new(dir: __dir__, name: "database")

# Object creation (only if it doesn't exist)
puts(my_database.create("0001", {
  "name" => "David",
  "country" => "CO",
  "info" => "Nothing to show"
}))

# Obtaining an object
object = my_database.get("0001")
puts(object)

# Modifying an object and saving it
object["name"] = "Deivid"
object.save()
puts(object)

# Setting directly the value of an element
puts(my_databse.set("0001.info", "Just a person"))

# List of objects
temp = ""
my_database.all().each do |k, v|
  temp += "   - #{v["name"]} (#{k})\n"
end
puts(temp)

# Deleting an object
puts(my_database.delete("0001"))

# Average time of execution: 41.5ms.
```

## "Documentation"
- [`new MeowDB(options)`](#new-meowdboptions)
    - `create(id, initialValue)`
    - `exists(id)`
    - `get(id)`
    - `set(id, value)`
    - `all()`
    - `delete(id)`
    - `find(callback, id?)`
    - `filter(callback, id?)`
- [`MeowDBError`](#meowdberror)


## new MeowDB(options)
Creates or gets a database
- **Parameters**:
    - `options` - A hash with the options
        - `options.dir` - A string indicating the directory that will have the database (must be an absolute path - the folder should be created)
        - `options.name` - A string with the name of the database
- **Raises**: [`MeowDBError`](#meowdberror) - If any option is invalid


### Methods
#### `all()`
Returns all data stored in the database
- **Returns**: `MeowDBHash` - All data
<hr>

#### `create(id, initialValue)`
Creates an element in the database with the specified ID and sets it's value
- **Parameters**:
    - `id` - A string representing the ID of the element to create
    - `initialValue` - The initial value of the element
- **Returns**: `Hash` - The created element
- **Raises**: [`MeowDBError`](#meowdberror) - If the ID or initialValue is invalid
<hr>

#### `delete(id)`
Deletes an element from the database
- **Parameters**:
    - `id` - A string representing the ID of the element to delete
- **Returns**: `Hash` - The deleted element
- **Raises**: [`MeowDBError`](#meowdberror) - If the ID is invalid
<hr>

#### `exists(id)`
Checks if an element exists in the database
- **Parameters**:
    - `id` - A string representing the ID of the element to check
- **Returns**: `TrueClass`/`FalseClass` - If it exists
- **Raises**: [`MeowDBError`](#meowdberror) - If the ID is invalid
<hr>

#### `get(id)`
Gets an element of the database
- **Parameters**:
    - `id` - A string representing the ID of the element to get
- **Returns**: `*` - The element
- **Raises**: [`MeowDBError`](#meowdberror) - If the ID is invalid
<hr>

#### `set(id, value)`
Sets the value of an element in the database
- **Parameters**:
    - `id` - A string representing the ID of the element to update
    - `value` - The new value of the element
- **Returns**: `*` - The value setted
- **Raises**: [`MeowDBError`](#meowdberror) - If the ID or value is invalid
<hr>

#### `find(callback, id?)`
Finds an element in the database.
You __should only__ use this function if you're finding for objects
- **Parameters**:
    - `id` - A string representing the ID of the root element to find another elements
- **Returns**: `*` - The element
- **Raises**: [`MeowDBError`](#meowdberror) - If the ID or callback is invalid
<hr>

#### `filter(callback, id?)`
Filters elements in the database.
You __should only__ use this function if you're filtering for objects
- **Parameters**:
    - `id` - A string representing the ID of the root element to find another elements
- **Returns**: `*` - The elements (MeowDBObject[] if they're objects, array with ID and value if not)
- **Raises**: [`MeowDBError`](#meowdberror) - If the ID or callback is invalid


## MeowDBError
Extends [`StandardError`](https://ruby-doc.org/core-2.5.1/StandardError.html), only used for error reference.
