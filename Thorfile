class Default < Thor
  include Thor::Actions

  desc 'setup', 'Setup the local development and testing environment.'
  def setup
    `rails new ./spec/dummy --no-rc -m ./spec/support/dummy/template`
  end
