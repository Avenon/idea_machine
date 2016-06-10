module IdeaExternal
  class API < Grape::API
      version 'v1', using: :header, vendor: 'ideamachine'
      format :json

    resource 'users' do

      desc 'Test endpoint users'
      get '/testuser' do
        { data: "TEST_user" }
      end

      desc 'List all users'
      params do
        optional :limit, type: String, desc: 'limit view users'
      end
      get '/' do
        User.all.limit(params[:limit])
      end

      desc 'Create a user.'
      params do
        requires :useremail, type: String, desc: 'User email'
        requires :userpass, type: String, desc: 'User password'
      end
      post do
        User.create!({
          email: params[:useremail],
          password: params[:userpass]
          })
      end

      desc 'Update a user.'
      params do
        requires :id, type: String, desc: 'ID user'
        optional :useremail, type: String, desc: 'User email'
        optional :userpass, type: String, desc: 'User password'
      end
      put ':id' do
          User.find(params[:id]).update({
            email: params[:useremail],
            password: params[:userpass]
            })
      end
    end

    resource 'ideas' do

      desc 'Test endpoint ideas'
      get '/testidea' do
        { data: "TEST_IDEA" }
      end

      desc 'List all ideas.'
      params do
        optional :limit, type: String, desc: 'limit view ideas'
      end
      get '/' do
        Idea.all.limit(params[:limit])
      end

      desc 'Create an idea.'
      params do
        requires :ideadescription, type: String, desc: 'Idea description'
        requires :user, type: String, desc: 'User id'
        # optional :test, type: String, desc: 'test' является необязательным параметром
      end
      post do
        Idea.create!({
          user_id: params[:user],
          description: params[:ideadescription]
          })
        #Idea.create! params.permit(:user_id, :description)
      end

      desc 'Read an idea.'
      params do
        requires :id, type: String, desc: 'Idea id'
      end
      get ':id' do
        Idea.find(params[:id])
      end

      desc 'Update an idea.'
      params do
        requires :id, type: String, desc: 'ID idea'
        requires :ideadescription, type: String, desc: 'Idea description'
        requires :user, type: String, desc: 'User id'
      end
      put ':id' do
          Idea.find(params[:id]).update({
            user_id: params[:user],
            description: params[:ideadescription]
            })
      end

      desc 'Delete an idea.'
      params do
        requires :id, type: String, desc: 'Idea id'
      end
      delete ':id' do
        Idea.find(params[:id]).destroy
      end
    end

    add_swagger_documentation \
      :info => {
        :title => "Idea machine API"
      },
      :hide_documentation_path => true,
      :mount_path => "/swagger_doc",
      :markdown => false,
      :api_version => 'v1'

    before do
        header['Access-Control-Allow-Origin'] = '*'
        header['Access-Control-Request-Method'] = '*'
    end

  end
end
