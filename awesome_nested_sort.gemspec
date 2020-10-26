
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "awesome_nested_sort/version"

Gem::Specification.new do |spec|
  spec.name          = "awesome_nested_sort"
  spec.version       = AwesomeNestedSort::VERSION
  spec.authors       = ["Ilias Papadamos"]
  spec.email         = ["epapadamos@gmail.com"]

  spec.summary       = %q{Easy GUI sorting for awesome nested set}
  spec.description   = %q{Easy GUI sorting for awesome nested set (works with jQuery)}
  spec.homepage      = "https://github.com/aypn0s/awesome_nested_sort.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.3.3"
end
