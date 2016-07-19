require "rails_helper"

RSpec.describe API::Root do #API class

  let(:idea) { FactoryGirl.create(:idea) } #Create idea with FactoryGirl define

  describe 'GET /api/ideas/:id' do
    it 'return idea' do
      # exercise
      get "/api/v1/ideas/#{idea.id}" #, {params: :here} ,  {auth_header: :here, version_header: :here}

      # verify
      expect_json_sizes 1
      expect_json_keys 'idea', [:id, :description, :user_id, :project_id]
      expect_json 'idea.description', 'test1'
    end
  end
end
