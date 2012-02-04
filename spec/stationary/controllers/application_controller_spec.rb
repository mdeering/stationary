require 'spec_helper'

describe Stationary::ApplicationController do
  
  include RSpec::Rails::ControllerExampleGroup

  context "The site root" do
    
    before do
      get :show
    end

    it { should render_template :file => 'stationary/index' }
    it { should respond_with(:success) }
    it { should_not set_the_flash }

  end

  context 'Requesting any page' do

    pending 'will first look for an index page for that route' do
      # FIXME: Running into issues with a random object appearing when the segments
      # are appended to the pathname instance.
      site_folder_root = "#{Rails.root}/app/views/stationary"
      path = Pathname.new(site_folder_root)
      Pathname.should_receive(:new).with(site_folder_root).and_return(path) 
      get :show
    end

  end

  context "A missing page" do

    before do 
      get :show, :path => [ 'missing' ]
    end

    it { should respond_with(:not_found) }
    it { should_not set_the_flash }

  end

end
