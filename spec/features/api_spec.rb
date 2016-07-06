require "rails_helper"

describe 'sample spec' do
  it 'should validate types' do
    get 'http://localhost:3000/api/ideas/9'
    expect_json_types(description: :string)
  end

  it 'should validate values' do
    get 'http://localhost:3000/api/ideas/9'
    expect_json(description: "test_test")
  end
end
