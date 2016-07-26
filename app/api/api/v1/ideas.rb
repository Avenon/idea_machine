module API
  module V1
    class Ideas < Grape::API

      resource :ideas do

        version 'v1'
        format :json

        desc "Return a list of ideas", { :entity => API::V1::Entities::Idea }
        params do
          optional :limit, type: String, desc: 'limit view ideas'
        end

        get '/', http_codes: [
          [200, "Ok", API::V1::Entities::Idea]
        ] do
          present Idea.all.limit(params[:limit]), with: API::V1::Entities::Idea, type: params[:type]
        end

        desc "Create a new idea", { :entity => API::V1::Entities::Idea }
        params do
          requires :ideadescription, type: String, desc: 'Idea description'
          requires :user, type: String, desc: 'User id'
        end

        post '/', http_codes: [
          [200, "Ok", API::V1::Entities::Idea]
        ] do
          idea = Idea.new
          idea.user_id = params[:user]
          idea.description = params[:ideadescription]
          idea.save

          status 200
          present idea, with: API::V1::Entities::Idea
        end

        desc 'Read an idea.', { :entity => API::V1::Entities::Idea }
        params do
          requires :id, type: String, desc: 'Idea id'
        end

        get ':id', http_codes: [
          [200, "Ok", API::V1::Entities::Idea]
        ] do
          idea = Idea.find(params[:id])
          present idea, with: API::V1::Entities::Idea, type: params[:type]
        end

        desc 'Update an idea.'
        params do
          requires :id, type: String, desc: 'ID idea'
          requires :ideadescription, type: String, desc: 'Idea description'
          requires :user, type: String, desc: 'User id'
        end
        put ':id', http_codes: [
          [200, "Ok", API::V1::Entities::Idea]
        ]  do
          Idea.find(params[:id]).update({
            user_id: params[:user],
            description: params[:ideadescription]
          })
        end

        desc 'Delete an idea.'
        params do
          requires :id, type: String, desc: 'Idea id'
        end
        delete ':id', http_codes: [
          [200, "Ok", API::V1::Entities::Idea]
        ]  do
          Idea.find(params[:id]).destroy
        end
      end
    end
  end
end
