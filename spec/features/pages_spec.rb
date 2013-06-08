require 'spec_helper'

describe 'pages' do
  it 'shows the home page' do
    visit '/'
    page.status_code.should be 200
  end
end
