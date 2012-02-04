require 'spec_helper'

describe Stationary::ApplicationHelper do
  
  include RSpec::Rails::HelperExampleGroup

  it 'should have access to any of the url and path methods of the main application' do
    helper.login_path.should == '/login'
  end

end

