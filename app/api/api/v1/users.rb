module API
  module V1
    class Users < Grape::API

      resource :users do

        version 'v1'
        format :json

        desc "Return a list of users", { :entity => API::V1::Entities::User }

        params do
          optional :limit, type: String, desc: 'limit view users'
        end

        get '/' , http_codes: [
          [200, 'Ok', API::V1::Entities::User]
        ] do
          users = User.all.limit(params[:limit])
          present users, with: API::V1::Entities::User, type: params[:type]
        end

        desc 'Create a user.', { :entity => API::V1::Entities::User }
        params do
          requires :useremail, type: String, desc: 'User email'
          requires :userpass, type: String, desc: 'User password'
        end

        post '/', http_codes: [
          [200, "Ok", API::V1::Entities::User]
        ]  do
          user = User.new
          user.email = params[:useremail]
          user.password = params[:userpass]
          user.save

          status 200
          present idea, with: API::V1::Entities::User
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
