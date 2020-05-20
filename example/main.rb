start = Time.now

require "meowdb"
db = MeowDB.new(dir: __dir__, name: "test")

puts("Object creation (only if it doesn't exist)")
object = db.create("0001", {
  "name" => "David",
  "country" => "CO",
  "info" => "Nothing to show"
})
puts(object, "\n")

puts("Obtaining an object")
object = db.get("0001")
puts(object, "\n")

puts("Editing 'name' key and saving")
print("#{object["name"]} - ")
object["name"] = "Deivid"
object.save()
puts(object["name"], "\n")

puts("Setting directly the value of an element")
object = my_databse.set("0001.info", "Just a person")
puts(object, "\n")

puts("List of objects")
object = db.all()
temp = ""
object.each do |k, v|
  temp += "   - #{v["name"]} (#{k})\n"
end
puts(temp, "\n")

puts("Deleting an object")
object = db.delete("0001")
puts(object, "\n")

puts("MeowDB.rb: #{(Time.now - start) * 1000}ms")