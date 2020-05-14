lib = File.expand_path("./lib/", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = "meowdb"
  spec.version     = "1.0.0"
  spec.summary     = "\"Database\" in JSON."
  spec.description = "A Ruby implementation of the MeowDB.js library (https://www.npmjs.com/package/meowdb)."
  spec.authors     = ["Drylotrans"]
  spec.email       = [""]
  spec.files       = Dir.glob("src/*.rb") + ["gembase.gemspec"]
  spec.require_paths = ["src"]
  spec.homepage    = "https://rubygems.org/gems/meowdb"
  spec.license     = "MIT"
  spec.metadata    = { 
    "source_code_uri" => "https://github.com/Drylotrans/MeowDB.rb"
  }
end