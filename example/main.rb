start = Time.now

require "meowdb"
db = MeowDB.new(dir: __dir__, name: "test")

puts("Object creation (only if it doesn't exist)")
puts(db.create("0001", {
  "name" => "David",
  "country" => "CO",
  "info" => "Nothing to show"
}), "\n")

puts("Obtaining an object")
object = db.get("0001")
puts(object, "\n")

puts("Editing 'name' key and saving")
print("#{object["name"]} - ")
object["name"] = "Deivid"
object.save()
puts(object["name"], "\n")

puts("Setting directly the value of an element")
puts(db.set("0001.info", "Just a person"), "\n")

puts("List of objects")
temp = ""
db.all().each do |k, v|
  temp += "   - #{v["name"]} (#{k})\n"
end
puts(temp, "\n")

puts("Deleting an object")
puts(db.delete("0001"), "\n")

puts("MeowDB.rb: #{(Time.now - start) * 1000}ms")