lib = File.expand_path('./src/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'meowdb'
  spec.version     = '1.0.0'
  spec.summary     = '"Database" in JSON.'
  spec.description = 'A Ruby implementation of the MeowDB.js library (https://www.npmjs.com/package/meowdb).'
  spec.authors     = ['Drylozu']
  spec.email       = ['']
  spec.files       = Dir.glob('src/*.rb') + Dir.glob('src/meowdb/*.rb') + ['meowdb.gemspec']
  spec.require_paths = ['src']
  spec.homepage    = 'https://rubygems.org/gems/meowdb'
  spec.license     = 'MIT'
  spec.metadata    = { 
    'source_code_uri' => 'https://github.com/Drylozu/MeowDB.rb'
  }
end
