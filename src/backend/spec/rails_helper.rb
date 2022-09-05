require 'simplecov'

require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

# check for pending migrations
begin
    ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
    puts e.to_s.strip
    exit 1
end

RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your examples within a transaction, remove the following line or assign false instead of true.
    config.use_transactional_fixtures = true

    config.infer_spec_type_from_file_location!

    config.filter_rails_from_backtrace!

end

Shoulda::Matchers.configure do |config|
    config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
    end
end

