start = Time.now

require "meowdb"
db = MeowDB.new(dir: __dir__, name: "test")

puts("Object creation (only if it doesn't exist)")
object = db.create("0001", {
  "name" => "David",
  "country" => "CO",
  "info" => "Nothing to show"
})
puts(object)
puts()


puts("Obtaining an object")
object = db.get("0001")
puts(object)
puts()

puts("Editing 'name' key and saving")
print("#{object["name"]} - ")
object["name"] = "Deivid"
object.save()
puts(object["name"])
puts()

puts("List of objects")
object = db.all()
temp = ""
object.each do |k, v|
  temp += "   - #{v["name"]} (#{k})\n"
end
puts(temp)
puts()

puts("Deleting an object")
object = db.delete("0001")
puts(object)

puts("MeowDB.rb: #{(Time.now - start) * 1000}ms")