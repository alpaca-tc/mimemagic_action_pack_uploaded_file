lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mimemagic_action_pack_uploaded_file/version'

Gem::Specification.new do |spec|
  spec.name          = 'mimemagic_action_pack_uploaded_file'
  spec.version       = MimemagicActionPackUploadedFile::VERSION
  spec.authors       = ['alpaca-tc']
  spec.email         = ['alpaca-tc@alpaca.tc']

  spec.summary       = %q{Extend ActionDispatch::HTTP::UploadedFile to detect file type from magic byte}
  spec.description   = %q{Extend ActionDispatch::HTTP::UploadedFile to detect file type from magic byte}
  spec.homepage      = 'https://github.com/alpaca-tc/mimemagic_action_pack_uploaded_file'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 4.1.0'
  spec.add_dependency 'mimemagic', '>= 0.3.0'
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
