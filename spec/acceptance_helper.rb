require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'
​
RspecApiDocumentation.configure do |config|
  config.format = :json
  config.docs_dir = Rails.root.join('doc', 'api', 'v1')
end
