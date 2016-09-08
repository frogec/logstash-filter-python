Gem::Specification.new do |s|
  s.name          = 'logstash-filter-python'
  s.version       = '0.1.0'
  s.licenses      = ['Apache License (2.0)']
  s.summary       = 'Run python script from logstash'
  s.description   = 'Run python script from logstash'
  s.homepage      = 'https://github.com/frogec/logstash-filter-python.git'
  s.authors       = ['Nejc Gutnik']
  s.email         = 'nejc.gutnik@sava-re.si'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", ">= 1.60", "<= 2.99"
  s.add_development_dependency 'logstash-devutils'
end
