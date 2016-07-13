require "rails_helper"

  RSpec.describe API::V1 do  #API class

  let(:idea) { FactoryGirl.create(:idea) } #Create idea with FactoryGirl define
#GET /api/ideas/:id
  describe 'GET /api/ideas/:id' do
    it 'return idea' do
      # setup
      # nothing to do here, because we lazily created our object in 'let' statement

      # exercise
      #get "/api/ideas/#{idea.id}", {params: :here} ,  {auth_header: :here, version_header: :here} # last two hashes are examples
      #get "http://localhost:3000/api/v1/ideas/1"
      get "/api/v1/ideas/1"
      # validate
      # expect_json_sizes 1
      # expect_json_keys 'idea', [:id, :description, :user_id, :project_id]

      expect_json(description: 'test1')

      # cleanup
      # We defined database_cleaner in rails_helper.rb
    end
  end
end
