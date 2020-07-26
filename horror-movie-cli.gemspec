
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "horror/movie/version"

Gem::Specification.new do |spec|
  spec.name          = "horror-movie-cli"
  spec.version       = Horror::Movie::VERSION
  spec.authors       = ["'billy needrith'"]
  spec.email         = ["'billy.needrith@gmail.com'"]

  spec.summary       = %q{Horror movie CLI}
  spec.description   = %q{This Ruby CLI Gem provides a listing of the Top 25 Horror Movies from the Rotten Tomatoes website.}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject do |f| 
      f.end_with?(".gem")
    end
  end
  spec.executables   = ["top_horror_movies"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
