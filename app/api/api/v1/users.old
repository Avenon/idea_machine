module API
  module V1
    class Users < Grape::API
      version 'v1'
      format :json

      resource :users do

        desc 'Test endpoint users'
        get '/testuser' do
          { data: "TEST_user" }
        end

        desc 'List all users'
        params do
          optional :limit, type: String, desc: 'limit view users'
        end
        get '/' do
          users = User.all.limit(params[:limit])
          users.map do |user|
          { id: user.id,
            email: user.email}
        end
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
    end
  end
end
