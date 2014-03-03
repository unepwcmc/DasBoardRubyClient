Gem::Specification.new do |s|
  s.name        = 'dasboard_client'
  s.version     = '0.0.0'
  s.date        = '2014-03-03'
  s.summary     = "DasBoard ruby adaptor"
  s.description = "Simple adaptor to allow posting stats to DasBoard"
  s.authors     = ["James Cox", "Adam Mulligan"]
  s.email       = ['james.cox@unep-wcmc.org', 'adam.mulligan@unep-wcmc.org']
  s.files       = ["lib/dasboard_client.rb"]
  s.homepage    =
    'http://rubygems.org/gems/dasboard_client'
  s.license       = 'BSD'

  s.add_dependency "rails", ">= 3.0.0"
end
