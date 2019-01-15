Gem::Specification.new do |s|
	s.name					 = 'kele'
	s.version				 = '0.0.1'
	s.date					 = '2019-01-15'
	s.summary				 = 'Kele API Client'
	s.description		 = 'A client for the Bloc API'
	s.authors				 = ['Daniel Hopler']
	s.email					 = 'hopler.daniel@gmail.com'
	s.files					 = ["lib/kele.rb"]
	s.require_paths  = ["lib"]
	s.homepage			 = 'http://rubygems.org/gems/kele'
	s.license  			 = 'MIT'
	s.add_runtime_dependency 'httparty', '~> 0.13'
end