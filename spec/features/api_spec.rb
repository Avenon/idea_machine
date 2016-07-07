require "rails_helper"

RSpec.describe IdeaExternal::API do # Your API class
  let(:idea) { create(:idea) } # You need Idea factory for this
  
  describe 'GET /api/ideas/:id'
    it 'return idea' do
      # setup
      # nothing to do here, because we lazily created our object in 'let' statement
      
      # exercise
      get "/api/ideas/#{idea.id}", {params: :here},  {auth_header: :here, version_header: :here} # last two hashes are examples
      
      # validate
      expect_json_sizes 1
      expect_json_keys 'idea', [:id, :description, :user_id, :project_id]
      
      # cleanup
      # In this simple case all cleaning is performed by database_cleaner
    end
  end
end
