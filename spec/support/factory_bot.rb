# Allows us to use factorybot when running rspec tests
RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
end