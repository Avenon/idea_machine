module IdeaExternal
  class API < Grape::API
    version 'v1', :using => :path

    format :json

    helpers do
#      def current_user
#        @current_user ||= User.authorize!(env)
#      end

#      def authenticate!
#        error!('401 Unauthorized', 401) unless current_user
#      end
    end

    resource :idea do

      desc 'Create an idea.'
      params do
        requires :description, type: String, description: 'My idea'
      end

      post '/ideas/new' do
#        authenticate!
        Idea.create!({
          user_id: current_user,
          description: 'test'
        })
      end

      desc 'Return all personal ideas'
      get '/all' do
#        authenticate!
#        current_user.ideas
        Idea.all
      end

      desc 'Return ideas'

        params do
          optional :token, type: String, default: nil
        end

        get '/ideas' do
          ideas = Idea.all

          ideas.each do |idea|
            response = {
            description: idea.description,
            status: 200
          }
          response.as_json
        end
      end
    end
  end
end

