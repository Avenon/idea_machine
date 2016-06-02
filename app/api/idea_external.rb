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

      desc 'Sign Up'

      post '/signup' do
      end

      desc 'Sign In'
      post '/signin' do
      end

      desc 'Get Token'
      get '/get_token' do
      end

      desc 'Create idea'
      post '/new' do
      end

      desc 'Update idea'
      post '/edit' do
      end

      desc 'Get ideas'
      get '/all' do
        Idea.all
      end

      desc 'Delete idea'
      delete '/delete' do
      end

      desc 'Reset Password'
      post '/reset_password' do
      end

      desc 'Clear Token'
      get '/clear_token' do
      end

    end
  end
end
